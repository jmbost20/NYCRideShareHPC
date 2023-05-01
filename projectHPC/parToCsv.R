#!/usr/bin/Rscript

rm(list=ls())

args = commandArgs(trailingOnly=TRUE)
print(args)
if(length(args) == 2){
  RpackagesDir = args[1]
  file = args[2]
} else {
  cat('usage: Rscript test.R <RpackagesDir> <file>\n', file=stderr())
  stop()
}

# Tell R to search in RpackagesDir, in addition to where it already
# was searching, for installed R packages.
.libPaths(new=c(RpackagesDir, .libPaths()))
if (!require("arrow")) { # If loading package fails ...
  # Install package in RpackagesDir.
  install.packages(pkgs="arrow", lib=RpackagesDir, repos="https://cran.r-project.org")
  stopifnot(require("arrow")) # If loading still fails, quit
}

file_data = read_parquet(file, as_data_frame = TRUE)
file_new = substr(file, 1, nchar(file)-8)
write.csv(file_data,file = file_new)

print("Success Stage 1")
