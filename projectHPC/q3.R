#!/usr/bin/Rscript

rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  file = args[1]
} else {
  cat('usage: Rscript q3.R <file>\n', file=stderr())
  stop()
}



taxi_data = read.csv(file)
numeric_col = unlist(lapply(taxi_data,is.numeric))
taxi_num <- taxi_data[,numeric_col]
taxi_cor = cor(taxi_num)
heatmap(taxi_cor, symm = TRUE)
summary(taxi_cor)
