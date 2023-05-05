#!/usr/bin/Rscript

rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 2){
  RpackagesDir = args[1]
  file = args[2]
} else {
  cat('usage: Rscript q1.R <file>\n', file=stderr())
  stop()
}


# Tell R to search in RpackagesDir, in addition to where it already
# was searching, for installed R packages.
.libPaths(new=c(RpackagesDir, .libPaths()))
if (!require("dplyr")) { # If loading package fails ...
  # Install package in RpackagesDir.
  install.packages(pkgs="dplyr", lib=RpackagesDir, repos="https://cran.r-project.org")
  stopifnot(require("dplyr")) # If loading still fails, quit
}



# Set the working directory
#setwd("/path/to/directory/containing/dummydata.csv")

# Read in the data
my_data <- read.csv(file)

# Print the data
print(my_data)

# Group the data by column "a" and summarize the data by the grouped column
count_df <- my_data %>% 
  group_by(hvfhs_license_num) %>% 
  summarise(n = n()) %>% 
  print()

# Summarize the data by adding up the tips and joining the resulting table with the count_df table
sum_tips <- my_data %>% 
  group_by(hvfhs_license_num) %>%  
  summarize(sum_x = sum(tips))
joined_table <- left_join(count_df, sum_tips, by = "hvfhs_license_num")

# Calculate the average tip and print the resulting table
joined_table %>% 
  mutate(avg_tip = n / sum_x) %>% 
  print()

# Calculate the total pay for the driver and the total cost for the rider
sum_driver_pay <- my_data %>% 
  group_by(hvfhs_license_num) %>%  
  summarize(sum_driver = sum(driver_pay))
sum_rider_pay <- my_data %>% 
  group_by(hvfhs_license_num) %>%   
  summarize(sum_rider = sum(base_passenger_fare))

# Print the resulting tables
print(sum_driver_pay)
print(sum_rider_pay)

# Calculate the trip time divided by trip miles
my_data %>% 
  group_by(hvfhs_license_num) %>%   
  summarise(trip_speed = sum(trip_miles / trip_time))
