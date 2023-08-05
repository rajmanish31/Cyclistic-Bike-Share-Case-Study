# Install required packages
install.packages("tidyverse")
install.packages("lubridate")
install.packages("ggplot")

# Load required packages
library(tidyverse)  # Helps wrangle data
library(lubridate)  # Helps wrangle date attributes
library(ggplot2)  # Helps visualize data

# Step 1: Load data

# Upload datasets
q1_2019 <- read_csv("Divvy_Trips_2019_Q1.csv")
q2_2019 <- read_csv("Divvy_Trips_2019_Q2.csv")
q3_2019 <- read_csv("Divvy_Trips_2019_Q3.csv")
q4_2019 <- read_csv("Divvy_Trips_2019_Q4.csv")

# Step 2: Wrangle data and combine into a single file

# Compare column names each of the files
colnames(q1_2019)
colnames(q2_2019)
colnames(q3_2019)
colnames(q4_2019)

# Because the columns are not consistent, rename the columns to make them consistent
q1_2019 <- rename(q1_2019
	,ride_id = trip_id
	,rideable_type = bikeid
	,started_at = start_time  
	,ended_at = end_time  
	,start_station_name = from_station_name 
	,start_station_id = from_station_id 
	,end_station_name = to_station_name 
	,end_station_id = to_station_id 
	,member_casual = usertype)

q2_2019 <- rename(q2_2019
    ,ride_id = "01 - Rental Details Rental ID"
	,rideable_type = "01 - Rental Details Bike ID"  
	,started_at = "01 - Rental Details Local Start Time"    
	,ended_at = "01 - Rental Details Local End Time"    
	,start_station_name = "03 - Rental Start Station Name"  
	,start_station_id = "03 - Rental Start Station ID" 
	,end_station_name = "02 - Rental End Station Name"  
	,end_station_id = "02 - Rental End Station ID" 
	,member_casual = "User Type")

q3_2019 <- rename(q3_2019
	,ride_id = trip_id
	,rideable_type = bikeid 
	,started_at = start_time  
	,ended_at = end_time  
	,start_station_name = from_station_name 
	,start_station_id = from_station_id 
	,end_station_name = to_station_name 
	,end_station_id = to_station_id 
	,member_casual = usertype)

q4_2019 <- rename(q4_2019
	,ride_id = trip_id
	,rideable_type = bikeid 
	,started_at = start_time  
	,ended_at = end_time  
	,start_station_name = from_station_name 
	,start_station_id = from_station_id 
	,end_station_name = to_station_name 
	,end_station_id = to_station_id 
	,member_casual = usertype)

# Inspect the dataframes and look for incongruencies
str(q1_2019)
str(q2_2019)
str(q3_2019)
str(q4_2019)

# Convert ride_id and rideable_type to character so that they can stack correctly
q1_2019 <- mutate(q1_2019, ride_id = as.character(ride_id)
	,rideable_type = as.character(rideable_type))
q2_2019 <- mutate(q2_2019, ride_id = as.character(ride_id)
	,rideable_type = as.character(rideable_type))
q3_2019 <- mutate(q3_2019, ride_id = as.character(ride_id)
	,rideable_type = as.character(rideable_type))
q4_2019 <- mutate(q4_2019, ride_id = as.character(ride_id)
	,rideable_type = as.character(rideable_type))

# Merge all dataframe in one big dataframe
trip_data <- bind_rows(q1_2019, q2_2019, q3_2019, q4_2019)

# Remove irrelevant data
trip_data <- trip_data %>%
	select(-c(gender, birthyear
		, "01 - Rental Details Duration In Seconds Uncapped"
		, tripduration
		, "05 - Member Details Member Birthday Year"
		, "Member Gender"))

# Step 3: Clean up and add data to prepare for analysis

# Add columns that list the date, month, day, and year of each ride
# This will allow us to aggregate ride data for each month, day, or year
trip_data$date <- as.Date(trip_data$started_at)
trip_data$month <- format(as.Date(trip_data$date), "%m")
trip_data$day <- format(as.Date(trip_data$date), "%d")
trip_data$year <- format(as.Date(trip_data$date), "%Y")
trip_data$day_of_week <- format(as.Date(trip_data$date), "%A")

# Add a "ride_length" calculation to all_trips
trip_data$ride_length <- difftime(trip_data$ended_at, trip_data$started_at)

# Remove "bad" data
# The dataframe includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or ride_length was negative
# We will create a new dataframe to remove these negative trip length trips
trip_data_clean <- trip_data[!(trip_data$ride_length <= 0),]