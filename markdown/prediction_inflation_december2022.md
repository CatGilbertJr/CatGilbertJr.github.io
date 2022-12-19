# When will inflation fall below 3%?

[TOC]

## Metaculus question

Here is the Metaculus question:

<iframe src="https://www.metaculus.com/questions/embed/13997/" width="550" height="260"></iframe>

Basically, when will the blue line in the chart below fall below the red line? 

<iframe src="https://fred.stlouisfed.org/graph/graph-landing.php?g=XNbB&width=670&height=475" scrolling="no" frameborder="0" style="overflow:hidden; width:670px; height:525px;" allowTransparency="true" loading="lazy"></iframe>

## Linear Trend

I have never tried to forecast inflation before. So I am going to start with the dumbest possible guess, which would be to just draw a linear trend with the FRED data. This would lead us to hit the 3% threshold by late-2023.

![prediction_inflation_december2022_linear_trend](https://raw.githubusercontent.com/CatGilbertJr/CatGilbertJr.github.io/main/figures/prediction_inflation_december2022_linear_trend.png)

This trajectory creates a pretty symmetry. After surpassing 3% in March 2021, inflation took about sixteen months to peak in June 2022. So maybe it's reasonable to think it will take sixteen months to come back down to 3%, which again, would put you in late-2023. This symmetry would resemble what happened in the early 1980s, which was the last time we had really high inflation.

<iframe src="https://fred.stlouisfed.org/graph/graph-landing.php?g=XNj2&width=670&height=475" scrolling="no" frameborder="0" style="overflow:hidden; width:670px; height:525px;" allowTransparency="true" loading="lazy"></iframe>

Or maybe it will be more like the mid-1970s, when we had the inflation growth rate peak at the end of 1974, decline through 1976, and then rebound. Relative to the 1974 peak, inflation growth did not go below 3 percent again for nearly a decade. But much of this happened [before](https://www.nber.org/system/files/chapters/c8886/c8886.pdf) the Fed received an explicit [mandate](https://www.richmondfed.org/publications/research/economic_brief/2011/eb_11-12#:~:text=Since%201977%2C%20the%20Federal%20Reserve,goals%20can%20be%20traced%20back) to maintain price stability and high employment. It's hard to imagine today's Fed allowing the experience of the 1970s to recur today. 

## Relevant reading

I struggled to come up with anything that would improve my prediction over my linear trend. I read the November CPI [report](https://www.bls.gov/news.release/cpi.nr0.htm), some Jason Furman [tweets](https://twitter.com/jasonfurman/status/1602665309718155266?s=20&t=BSrIS83ADqzm9PJSu4JEaw), a Larry Summers [interview](https://www.youtube.com/watch?v=j7PQg5q2lOk&list=PLGaYlBJIOoa9Xtb-GTfRAPH2V6Yl90a1g), an old-but-prescient Robert de Neufville [blog post](https://substack.com/profile/2278361-robert-de-neufville), and a short Brookings [article](https://www.brookings.edu/bpea-articles/understanding-u-s-inflation-during-the-covid-era/). The authors of the Brookings article model six scenarios, and in all of them, core inflation exceeds 4% by late-2023. Their analysis suggests my linear trend is too optimistic. But their paper was written at a much uglier part of the curve, so I'm hesitant to update much from it.

## TIPS Spread

I should mention the TIPS spread. My friend was saying that if you want to know where inflation is going to go, you need to look at the yield gap between U.S. treasury bonds and Treasury Inflation-Protected Securities (TIPS). In theory, this represents the market's prediction for average inflation over the bond term. As I write this, the 5-Year Breakeven Inflation Rate is 2.1%. I could easily be confused, but this seems more optimistic than my linear trend. In fact, those expectations seem consistent with the inflation rate dropping to the Fed's 2% target in like 3 months, and then sitting at the rate for like 57 months. That seems way too optimistic, but I guess if I'm really confident, I should buy some TIPS?  

<iframe src="https://fred.stlouisfed.org/graph/graph-landing.php?g=XNGl&width=670&height=475" scrolling="no" frameborder="0" style="overflow:hidden; width:670px; height:525px;" allowTransparency="true" loading="lazy"></iframe> 

I did some back-testing using FRED data to see how well actual 5-year annualized growth in CPI-U tracked with the average 5-year breakeven inflation rate. Here's the data I calculated. The correlation was 0.08. I haven't tested, but I doubt that performs much better than simple linear trends.

**Back testing the 5-year Breakeven Inflation Rate against Actual Rates of Inflation** 

| CY   | Average 5-Year Breakeven Inflation Rate | Average CPI-U that year | Average CPI-U, 5-years later | Actual CPI-U 5-Year Growth, Annualized |
| ---- | --------------------------------------: | ----------------------: | ---------------------------: | -------------------------------------: |
| 2003 |                                     1.7 |                   184.0 |                        215.3 |                                    3.2 |
| 2004 |                                     2.4 |                   188.9 |                        214.6 |                                    2.6 |
| 2005 |                                     2.6 |                   195.3 |                        218.1 |                                    2.2 |
| 2006 |                                     2.5 |                   201.6 |                        224.9 |                                    2.2 |
| 2007 |                                     2.3 |                   207.3 |                        229.6 |                                    2.1 |
| 2008 |                                     1.5 |                   215.3 |                        233.0 |                                    1.6 |
| 2009 |                                     1.1 |                   214.6 |                        236.7 |                                    2.0 |
| 2010 |                                     1.7 |                   218.1 |                        237.0 |                                    1.7 |
| 2011 |                                     1.9 |                   224.9 |                        240.0 |                                    1.3 |
| 2012 |                                     2.0 |                   229.6 |                        245.1 |                                    1.3 |
| 2013 |                                     1.9 |                   233.0 |                        251.1 |                                    1.5 |
| 2014 |                                     1.7 |                   236.7 |                        255.6 |                                    1.6 |
| 2015 |                                     1.4 |                   237.0 |                        258.8 |                                    1.8 |
| 2016 |                                     1.4 |                   240.0 |                        271.0 |                                    2.5 |
| 2017 |                                     1.7 |                   245.1 |                        290.0 |                                    3.4 |

## Prediction

U.S. seasonally adjusted annual CPI inflation will fall below 3% by **November 2023**. 

