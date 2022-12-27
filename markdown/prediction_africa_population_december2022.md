# What will Africa's population be in 2030?

[TOC]

## Metaculus question

<iframe src="https://www.metaculus.com/questions/embed/13701/" width="550" height="260"></iframe>

## Methods

This was an easy one. As the question states, the United Nations projects the African population to be about 1.7 billion. I skimmed their population projection [methodology](https://population.un.org/wpp/Publications/Files/WPP2022_Methodology.pdf). It's very impressive. Those guys know a lot about population projecting.

The U.N. modeling team put all [their data](https://github.com/PPgp/wpp2022) on Github. The data includes fertility and mortality rates by country, year, and single year of age. These data are provided historically (from 1950 to 2021) and projected forward (from 2022 to 2100). The files also include rates of net migration by country and year, and some other stuff too (e.g. sex ratios for newborns). Basically, everything you need to simulate population. Just for fun, I used their fertility/mortality/migration rates to build a [little simulation model](https://github.com/CatGilbertJr/CatGilbertJr.github.io/blob/main/code/africa_population_simulation/un_pop_projection_analysis_2022_12_26.R). 

![](https://github.com/CatGilbertJr/CatGilbertJr.github.io/blob/main/figures/prediction_africa_population_december2022_compare_to_un.png?raw=true)

Match checks out... mostly. Not sure why I'm not matching exactly. Also, not sure why my mini-model performs so much worse for the United States. It suggests that either (1) something in my code is screwy or (2) they are doing something else beyond applying their projected fertility/mortality/migration projections.

![](https://github.com/CatGilbertJr/CatGilbertJr.github.io/blob/main/figures/prediction_africa_population_december2022_compare_to_un_usa.png?raw=true) 

Either way, it seems to work good enough by 2030. Population growth in Africa has been very smooth for decades, and the U.N. population just continues that trend in a straight-forward way. So their projection looks good to me. I accepted it with pretty narrow bounds.

## Prediction

U.S. seasonally adjusted annual CPI inflation will fall below 3% by **November 2023**. 

