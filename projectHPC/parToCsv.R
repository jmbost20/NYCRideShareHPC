#!/usr/bin/Rscript

rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  RpackagesDir = args[1]
} else {
  cat('usage: Rscript test.R <RpackagesDir>\n', file=stderr())
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

print("Success Stage 1")

file_names <- list.files(pattern = "\\.parquet$")

for(file in file_names){
file_data = read_parquet(file, as_data_frame = TRUE)
file_new = substr(file, 1, nchar(file)-8)
write_csv(file_data,file = file_new)
}
