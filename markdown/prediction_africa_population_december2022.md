# What will Africa's population be in 2030?

[TOC]

## Metaculus question

<iframe src="https://www.metaculus.com/questions/embed/13701/" width="550" height="260"></iframe>

## Methods

This was an easy one. As the question states, the United Nations projects the African population to be about 1.7 billion. I skimmed their population projection [methodology](https://population.un.org/wpp/Publications/Files/WPP2022_Methodology.pdf), and it's very impressive. Those folks know a lot about population projecting.

The U.N. modeling team helpfully put their [data](https://github.com/PPgp/wpp2022) on Github. The data includes fertility and mortality rates by country, year, and single year of age. These data are provided historically (from 1950 to 2021) and projected forward (from 2022 to 2100). The files also include rates of net migration by country and year, and some other stuff too (e.g. sex ratios for newborns). Basically, everything you need to simulate population. Just for fun, I used their fertility/mortality/migration rates to build a [little simulation model](https://github.com/CatGilbertJr/CatGilbertJr.github.io/blob/main/code/africa_population_simulation/un_pop_projection_analysis_2022_12_26.R). 

![](https://github.com/CatGilbertJr/CatGilbertJr.github.io/blob/main/figures/prediction_africa_population_december2022_compare_to_un.png?raw=true)

Match checks out... mostly. I'm trying to use identical assumptions, so I'm not sure why my model doesn't match the U.N projections exactly. Also, I'm not sure why my mini-model performs so much worse for the United States, relative to Africa. It suggests that either (1) something in my code is screwy or (2) they are doing some other stuff that I'm not accounting for.

![](https://github.com/CatGilbertJr/CatGilbertJr.github.io/blob/main/figures/prediction_africa_population_december2022_compare_to_un_usa.png?raw=true) 

Either way, it seems to work good enough to project 2030. Population growth in Africa has been very smooth for decades, and the U.N. population projection just continues that trend in a straight-forward way (see below). Seems reasonable to me.

![](https://github.com/CatGilbertJr/CatGilbertJr.github.io/blob/main/figures/prediction_africa_population_december2022_cumulative_population.png?raw=true) 

I played with assuming smaller changes in the mortality and fertility rates, but this didn't make a big difference, and if anything, seemed less credible than what the U.N. was assuming. So I'm just going with their 1.7 billion number.

## Prediction

Africa's population in 2030 will be 1.69 billion people.
