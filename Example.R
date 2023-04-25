rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  RpackagesDir = args[1]
} else {
  cat('usage: Rscript singleR.R <RpackagesDir>\n', file=stderr())
  stop()
}

# Tell R to search in RpackagesDir, in addition to where it already
# was searching, for installed R packages.
.libPaths(new=c(RpackagesDir, .libPaths()))
if (!require("microbenchmark")) { # If loading package fails ...
  # Install package in RpackagesDir.
  install.packages(pkgs="microbenchmark", lib=RpackagesDir, repos="https://cran\
.r-project.org")
  stopifnot(require("microbenchmark")) # If loading still fails, quit.
}

a = 2
b = microbenchmark(2 + 2, 2 + a)
print(b)

