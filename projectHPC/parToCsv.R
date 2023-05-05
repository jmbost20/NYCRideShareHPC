#!/usr/bin/Rscript

rm(list=ls())

args = commandArgs(trailingOnly=TRUE)
print(args)
if(length(args) == 1){
  RpackagesDir = args[1]
  #file = args[2]
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



files <- list.files(pattern = "\\.parquet$")


storage_dat = data.frame()
for(file in files){
file_dat = read_parquet(file, as_data_frame = TRUE)
storage_dat = merge(storage_dat,file_dat)
}

write_parquet(storage_dat, "merged_taxi.parquet")

print("Success Stage 1")
