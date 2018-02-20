library(tidyverse)

# Readr vs base R import functions

path <- "hurricane amy.csv"

tidy <- read_csv(path)

base <- read.csv(path)

?read_csv

# read_csv2 is for europe

# Code optimization - microbenchmark

library(microbenchmark)

x <- runif(100)
microbenchmark(sqrt(x),x ^ 0.5)

suppressMessages(
  microbenchmark(read.csv(path), read_csv(path), read_delim(path, delim = ","))
)

ct <- "ciiiinnciiiccc"

suppressMessages(
  microbenchmark( read_csv(path), read_csv(path, col_types = ct))
)

# From Sean Lahman's Baseball Database

baseball <- "Teams.csv"

teams <- read_csv(baseball)

suppressMessages(
  microbenchmark(read.csv(baseball), read_csv(baseball))
)


# For the fastest performance on very large tables, check out the package "data.table"

library(data.table)
?fread

suppressMessages(
  microbenchmark(read_csv(baseball), fread(baseball))
)
