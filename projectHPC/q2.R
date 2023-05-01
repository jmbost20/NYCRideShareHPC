#!/usr/bin/Rscript

data <- read.csv("dummydata.csv",header = FALSE)
head(data)
#data$V10[0]

miles <- c()
driverpay <- c()
miles <- data$V10
driverpay <- data$V19



dates <- c()
profit <- c()
datalen <- nrow(data)

for (i in 1:datalen) {
  dates[i] <- data$V4[i]
}

miles <- c()
driverpay <- c()
miles <- data$V10
miles <- miles[2:length(miles)]
driverpay <- data$V19
driverpay <- driverpay[2:length(driverpay)]

for (i in 1:datalen-1) {
  profit[i] <- as.double(driverpay[i]) / as.double(miles[i]) #per mile profit
}

dates <- dates[2:length(dates)]

dates <- substr(dates, 6, 7)


distribution <- tapply(profit, dates, mean)
distribution
