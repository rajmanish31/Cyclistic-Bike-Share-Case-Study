# Cyclistic-Bike-Share-Case-Study
This is part of Google Data Analytics Capstone: Complete a Case Study Project

## Introduction
Welcome to the Cyclistic bike-share analysis case study! In this case study, you will perform many real-world tasks of a junior data analyst. You will work for a fictional company, Cyclistic, and meet different characters and team members. In order to answer the key business questions, you will follow the steps of the data analysis process: **ask, prepare, process, analyze, share,** and **act.**

## Scenario
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## About the Company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

The project follows the six step data analysis process: **ask, prepare, process, analyze, share,** and **act.**

## PHASE 1: Ask

Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno, the director of marketing and your manager, has assigned you the first question to answer: **How do annual members and casual riders use Cyclistic bikes differently?**

**Summary of the business task:**

* The goal of this case study is to identify how do annual members and casual riders use Cyclistic bikes differently.
* This comparison along with other tasks will later be used by marketing department for developing strategies aimed at converting casual riders into members.

**Stakeholders:**

Primary Stakeholders: The director of marketing and Cyclistic executive team.

Secondary Stakeholders: Cyclistic marketing analytics team.

## PHASE 2: Data Preparation

The data that we will be using for this case study is Cyclistic’s historical trip data from Q1 2019 to qQ4 2019.

The data has been made available by Motivate International Inc. on this [link](https://divvy-tripdata.s3.amazonaws.com/index.html) under this [license](https://ride.divvybikes.com/data-license-agreement).

The dataset consists of 4 CSV files (each for a quarter) with 13 columns and around 4 million rows.

ROCCC approach is used to determine the credibility of the data

* **R**eliable – It is complete and accurate and it represents all bike rides taken in the city of Chicago for the selected duration of our analysis.
* **O**riginal - The data is made available by Motivate International Inc. which operates the city of Chicago’s Divvy bicycle sharing service which is powered by Lyft.
* **C**omprehensive - The data includes all information about ride details including starting time, ending time, station name, station ID, type of membership and many more.
* **C**urrent – It is up-to-date as it includes data until end of June 2023
* **C**ited - The data is cited and is available under Data License Agreement.

## PHASE 3: Process

Before we start analyzing, it is necessary to make sure data is clean, free of error and in the right format.

**Tools:** R Programming is used for its ability to handle huge datasets efficiently.

Install and load required packages:

* tidyverse for data import and wrangling
* lubridate for date functions
* ggplot for visualization

``` {r}
library(tidyverse)  # Helps wrangle data
library(lubridate)  # Helps wrangle date attributes
library(ggplot2)  # Helps visualize data
```
Steps to follow for data process:

1. Load data
2. Wrangle data and combine into a single file
   * Compare column names each of the files
   * Rename the columns to make them consistent
   * Convert ride_id and rideable_type to character so that they can stack correctly
   * Merge all dataframe in one big dataframe
   * Remove irrelevant data
3. Clean up and add data to prepare for analysis
   * Add columns that list the date, month, day, and year of each ride
   * Add a "ride_length" calculation to all_trips
   * Remove "bad" data

* Click [here](https://github.com/rajmanish31/Cyclistic-Bike-Share-Case-Study/blob/main/process_script.R) to view the R script for above steps.

## PHASE 4: Analyse

Perform some descriptive analysis and data aggration and visualization.

* Click [here](https://github.com/rajmanish31/Cyclistic-Bike-Share-Case-Study/blob/main/analysis_script.R) to view R script of the analysis process.

## PHASE 5: Share

Before making recommendations to the marketing department, we will create some visualizations to share with stakeholders as well as give us a better idea of what insights to share.

* Total number of rides of customer and subscriber vs day of the week

  ![1](https://github.com/rajmanish31/Cyclistic-Bike-Share-Case-Study/assets/61666590/6293ee49-d809-4b67-886d-01b5f5293e44)

From the above we can say that total number of rides of subscriber in weekdays is more than weekend but total number of rides of customer is more on weekend. Overall subscriber has more number of rides than customer but difference in number of rides is more on weekdays than weekend.

* Average ride duration of customer and subscriber vs day of the week

![2](https://github.com/rajmanish31/Cyclistic-Bike-Share-Case-Study/assets/61666590/cca159a0-16e2-4c02-ab01-05dfc5c9bd84)

From the above chart we can say that although customer has less number of rides but average duration is more than subscriber. Average duration of subscriber is almost same on each day of week.

* Total number of rides by customer and subscriber by month

![3](https://github.com/rajmanish31/Cyclistic-Bike-Share-Case-Study/assets/61666590/7ac0aa4a-1713-4ff8-a281-6fd08016600c)

From above graph, we can say that subscriber has more number of rides throughout the year than customer. Also from May to October both subscriber and customer has more number of ride than other months of the year.

## PHASE 6: Act

For the last step in the data analysis process, we will make three recommendations to increase the number of Subscribers every year. But first, we'll lay out three key insights.

**Key Findings:**

1. Customer rides the most on weekends. In contrast, Subscriber makes the most trips during the week.
2. On average, Subscriber rides shorter than Customer.
3. Both Customer and Subscriber have the highest number of trips in the summer months and the least number of trips in late winter and early spring.

**Recommendations:**

1. Target Customer bike rentals for weekend fun.
2. Create a big summer campaign when more people can afford to rent bikes.
