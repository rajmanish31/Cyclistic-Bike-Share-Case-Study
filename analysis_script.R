# Descriptive analysis on ride_length (all figures in minutes)
mean(trip_data_clean$ride_length)
median(trip_data_clean$ride_length) 
max(trip_data_clean$ride_length) 
min(trip_data_clean$ride_length)

# Compare Subscriber and Customer trip stats
aggregate(trip_data_clean$ride_length ~ trip_data_clean$member_casual, FUN = mean)
aggregate(trip_data_clean$ride_length ~ trip_data_clean$member_casual, FUN = median)
aggregate(trip_data_clean$ride_length ~ trip_data_clean$member_casual, FUN = max)
aggregate(trip_data_clean$ride_length ~ trip_data_clean$member_casual, FUN = min)

# Arrange the day_of_week column in the order
trip_data_clean$day_of_week <- ordered(trip_data_clean$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Check the average ride time per day and the total number of trips for Customer and Subscriber
analysis_data <- trip_data_clean %>%
	group_by(member_casual, day_of_week) %>%  # Groups by member_casual
    summarise(number_of_rides = n() # Calculates the number of rides and average duration 
    ,average_ride_length = mean(ride_length), .groups = "drop") %>% # Calculates the average duration
    arrange(member_casual, day_of_week) # Sort

# Plot total rides of Customer and Subsriber Vs. Day of the week
ggplot(plot, aes(x = day_of_week, y = number_of_rides, fill = member_casual)) +
labs(title = "Total rides of Customer and Subsriber Vs. Day of the week") +
geom_col(width=0.5, position = position_dodge(width=0.5))+
scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

# Plot average ride time of Customer and Subsriber Vs. Day of the week
ggplot(plot,aes(x = day_of_week, y = average_ride_length, fill = member_casual)) +
geom_col(width=0.5, position = position_dodge(width=0.5)) + 
labs(title = "Average ride time of Customer and Subsriber Vs. Day of the week")+
scale_y_continuous(labels = function(x) format(x, scientific = FALSE))

# Plot total rides by Customer and Subsriber by Month
trip_data_clean %>%  
	group_by(member_casual, month) %>% 
	summarise(number_of_rides = n(),.groups="drop") %>% 
	arrange(member_casual, month)  %>% 
	ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) +
	labs(title ="Total rides by Customer and Subsriber riders by Month") +
	theme(axis.text.x = element_text(angle = 45)) +
	geom_col(width=0.5, position = position_dodge(width=0.5)) +
	scale_y_continuous(labels = function(x) format(x, scientific = FALSE))