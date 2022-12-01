# Crowdfunding-ETL


## Overview of Project
###### Explain the purpose of this analysis

This project is to refactor or an existing codebase so that it is more efficient and is more robust to analyze stocks of any year in a specific data set.
 We have updated the code base to loop over the relavent stock ticker just once to collect stock volume info. It's performance over a year is collected and presented. 

## Results
###### Using images and examples of your code, compare the stock performance between 2017 and 2018, as well as the execution times of the original script and the refactored script.

As we can observe, overall the performance of stocks in 2018 was far worse than in 2017. We can see this in the images provided below.

![This is an image](https://imgur.com/jUumeOl.png)
![This is an image](https://imgur.com/JvhHZAh.png)

Furthermore there is no correlation with volume to expected return. 
Two stocks consistently performed well over the two years, which were ENPH and RUN. Due to our refactored code we can also see that the execution time improved by an order of 10 or more.
