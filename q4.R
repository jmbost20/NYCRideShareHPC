rm(list=ls())

#library(dplyr)
#library(ggplot2)

.libPaths(new=c(RpackagesDir, .libPaths()))
if (!require("dplyr")) { # If loading package fails ...
  # Install package in RpackagesDir.
  install.packages(pkgs="dplyr", lib=RpackagesDir, repos="https://cran.r-project.org")
  stopifnot(require("dplyr")) # If loading still fails, quit
}

if(length(args) == 1){
  data_file = args[1]
  #data_directory = args[2]
} else {
  cat('usage: Rscript hw4.R <template spectrum> <data directory>\n')
  stop()
}

data <- read.csv(data_file, header = TRUE)

q4data <- data[, c('pickup_datetime', 'driver_pay', 'trip_miles')]
q4data$profit_per_mile <- q4data$driver_pay / q4data$trip_miles
q4data$time <- as.POSIXct(q4data$pickup_datetime)
q4data$intervals <- cut(q4data$time, breaks = "15 min")
q4data$time_label <- format(as.POSIXct(q4data$intervals), "%H:%M")

group_df <- q4data %>%
  group_by(time_label) %>%
  summarize(avg_pay = mean(driver_pay) , avg_pay_by_mile = mean(profit_per_mile))
