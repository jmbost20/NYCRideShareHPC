#!/usr/bin/Rscript
library(arrow)

df4 <- read_parquet("~/Downloads/Parquets/fhvhv_tripdata_2020-04.parquet")
df5 <- read_parquet("~/Downloads/Parquets/fhvhv_tripdata_2020-05.parquet")
df6 <- read_parquet("~/Downloads/Parquets/fhvhv_tripdata_2020-06.parquet")
df7 <- read_parquet("~/Downloads/Parquets/fhvhv_tripdata_2020-07.parquet")
df8 <- read_parquet("~/Downloads/Parquets/fhvhv_tripdata_2020-08.parquet")
df9 <- read_parquet("~/Downloads/Parquets/fhvhv_tripdata_2020-09.parquet")
df10 <- read_parquet("~/Downloads/Parquets/fhvhv_tripdata_2020-10.parquet")

df4sub <- df4[1:1000, ]
df5sub <- df5[1:1000, ]
df6sub <- df6[1:1000, ]
df7sub <- df7[1:1000, ]
df8sub <- df8[1:1000, ]
df9sub <- df9[1:1000, ]
df10sub <- df10[1:1000, ]

combined <- rbind(df4sub, df5sub, df6sub, df7sub,df8sub, df9sub, df10sub)

miles <- c()
driverpay <- c()
miles <- combined["trip_miles"]
driverpay <- combined["driver_pay"]

dates <- c()
profit <- c()
datalen <- nrow(combined)

dates <- combined$request_datetime

miles <- c()
driverpay <- c()
miles <- combined$"trip_miles"

driverpay <- combined$"driver_pay"

for (i in 1:datalen) {
  profit[i] <- as.double(driverpay[i]) / as.double(miles[i])
}

length(dates)
length(profit)

dates <- substr(dates, 6, 7)

profit[is.infinite(profit)] <- 0

distribution <- tapply(profit, dates, mean)
distribution
