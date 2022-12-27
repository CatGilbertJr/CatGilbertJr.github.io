library(tidyverse)
library(writexl)
library(scales)

#------------------------------------------------------------------------------
# 0. Parameters
#------------------------------------------------------------------------------

selected_region <- "Africa" 
load_datasets <- FALSE
hold_tfr_constant <- TRUE
hold_mrt_constant <- TRUE
max_year <- 2100
 
#------------------------------------------------------------------------------
# 1. Load files
#------------------------------------------------------------------------------

#Note: wpp2022 directory was cloned from https://github.com/PPgp/wpp2022
if (load_datasets) {
  load(file='wpp2022/data/countries.rda')
  load(file='wpp2022/data/popAge1dt.rda')
  load(file='wpp2022/data/tfrproj1dt.rda')
  load(file='wpp2022/data/popprojAge1dt.rda')
  load(file='wpp2022/data/percentASFR1dt.rda')
  load(file='wpp2022/data/mx1dt.rda')
  load(file='wpp2022/data/migration1dt.rda')
  load(file='wpp2022/data/sexRatio1dt.rda')
}

#------------------------------------------------------------------------------
# 2. Find code for selected region
#------------------------------------------------------------------------------

s.code <- countries %>%
  filter(name==selected_region) %>%
  select(country_code) %>%
  as.numeric

#------------------------------------------------------------------------------
# 3. Filter data to specified region and trim variables
#------------------------------------------------------------------------------

filter_trim <- function(data,varlist) {
  data %>%
    filter(country_code==s.code) %>%
    select(varlist)
}

s.popAge1dt      <- filter_trim(popAge1dt,      c("year","age","popM","popF"))
s.tfrproj1dt     <- filter_trim(tfrproj1dt,     c("year","tfr"))
s.percentASFR1dt <- filter_trim(percentASFR1dt, c("year","age","pasfr"))
s.mx1dt          <- filter_trim(mx1dt,          c("year","age","mxM","mxF"))
s.migration1dt   <- filter_trim(migration1dt,   c("year","mig"))
s.sexRatio1dt    <- filter_trim(sexRatio1dt,    c("year","srb"))
s.popprojAge1dt  <- filter_trim(popprojAge1dt,  c("year","age","popM","popF"))

#------------------------------------------------------------------------------
# 4. FUNCTION: Births simulator
#------------------------------------------------------------------------------

birth_simulator <- function(yr,pop_file) {
  tfr  <- filter(s.tfrproj1dt,year==yr)$tfr
  if (hold_tfr_constant) {
    tfr  <- filter(s.tfrproj1dt,year==2022)$tfr
  }
  srb  <- filter(s.sexRatio1dt,year==yr)$srb
  asfr <- filter(s.percentASFR1dt,year==yr)
  birthsT <- pop_file %>%
    left_join(asfr,by="age") %>%
    mutate(birth_col=(pasfr/100)*popF*tfr) %>%
    select(birth_col) %>%
    sum(na.rm=TRUE)
  birthsF <- birthsT/(1+srb)
  birthsM <- birthsT - birthsF
  data.frame(age=0,popM=birthsM,popF=birthsF)
}

#------------------------------------------------------------------------------
# 5. FUNCTION: Death simulator
#------------------------------------------------------------------------------

death_simulator <- function(yr,pop_file) {
  mort <- filter(s.mx1dt,year==yr)
  if (hold_mrt_constant) {
    mort <- filter(s.mx1dt,year==2022)
  }
  pop_file_with_mort <- pop_file %>%
    left_join(mort,by="age") 
  
  #Assume 40% of people aged >100 die every year.
  pop_file_with_mort <- pop_file_with_mort %>%
    mutate(mxM=if_else(age>100,0.4,mxM))
  pop_file_with_mort <- pop_file_with_mort %>%
    mutate(mxF=if_else(age>100,0.4,mxF))  
  
  deathsM <- pop_file_with_mort$mxM * pop_file_with_mort$popM
  deathsF <- pop_file_with_mort$mxF * pop_file_with_mort$popF
  
  data.frame(age=pop_file_with_mort$age,deathsM,deathsF)
  
}

#------------------------------------------------------------------------------
# 5. FUNCTION: Update population file
#------------------------------------------------------------------------------

update_pop_file <- function(yr,pop_file) {
  
  #Remove deaths
  pop_file <- pop_file %>%
    left_join(deaths,by="age") %>%
    mutate(popM=popM-deathsM,
           popF=popF-deathsF) %>%
    select(-deathsM,-deathsF)
  
  #Increment age
  pop_file <- mutate(pop_file,age=age+1)
  
  #Add births
  pop_file <- rbind(births,pop_file)
  
  #Adjust for migration
  mig <- filter(s.migration1dt,year==yr)$mig
  mig_adj <- 1 + mig/sum(pop_file$popM,pop_file$popF)
  mutate(pop_file,
         popM=popM*mig_adj,
         popF=popF*mig_adj)
}
  
#------------------------------------------------------------------------------
# Execution
#------------------------------------------------------------------------------

pop_file <- select(filter(s.popAge1dt,year==2021),-year)
full_pop_file <- NULL
for (i in 2022:2100) {
  births <- birth_simulator(i,pop_file)
  deaths <- death_simulator(i,pop_file)
  pop_file <- update_pop_file(i,pop_file)
  full_pop_file <- rbind(full_pop_file,mutate(pop_file,year=as.character(i)))
}
myProjection <- full_pop_file

#------------------------------------------------------------------------------
# Figure 1. My Projection vs. United Nations
#------------------------------------------------------------------------------

calc_pop <- function(data,yr) {
  filter(data,year==yr) %>%
  mutate(pop=popM+popF) %>%
    select(pop) %>%
    sum()
}

pop2021 <- calc_pop(s.popAge1dt,2021)
table_summarizer <- function(x,label,comparison,lb,ub) {
  x %>%
    mutate(pop=popM+popF) %>%
    group_by(year) %>%
    summarise(tot_pop=sum(pop)) %>%
    mutate(my_change=tot_pop-comparison) %>%
    filter(year<=ub) %>%
    filter(year>=lb) %>%
    mutate(vers=label)
}
table1 <- rbind(table_summarizer(myProjection,"ME",pop2021,2022,2030),
                table_summarizer(s.popprojAge1dt,"UN",pop2021,2022,2030))
ggplot(data=table1, aes(x=year,y=my_change,group=vers)) +
  geom_line(aes(color=vers)) + theme_classic() +
  ggtitle("Africa Population - Comparing my projection the UN, in thousands") +
  xlab("") + ylab("Cumulative change in population from 2021") +
  scale_y_continuous(label=comma)

#------------------------------------------------------------------------------
# Figure 2. 1990 to 2030
#------------------------------------------------------------------------------

pop1980 <- calc_pop(s.popAge1dt,1980)
pop2000 <- calc_pop(s.popAge1dt,2000)
table2 <- rbind(table_summarizer(s.popAge1dt,"Hist",pop1980,1981,2021),
                table_summarizer(myProjection,"Proj",pop1980,2022,2030))
ggplot(data=table2, aes(x=as.numeric(year),y=my_change)) +
  geom_line() + theme_classic() +
  ggtitle("Africa Population - 1981 to 2030") +
  xlab("") + ylab("Cumulative change in population from 1980, in thousands") +
  scale_y_continuous(label=comma) + theme(legend.position="none")

#------------------------------------------------------------------------------
# Report population in 2030
#------------------------------------------------------------------------------

filter(myProjection,year==2030) %>%
  mutate(pop=popM+popF) %>%
  select(pop) %>%
  sum()
