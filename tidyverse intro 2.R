library(tidyverse)

# Readr vs base R import functions

path <- "hurricane amy.csv"

tidy <- read_csv(path)

base <- read.csv(path)

# Code optimization - microbenchmark

library(microbenchmark)

x <- runif(100)
microbenchmark(sqrt(x),x ^ 0.5)

suppressMessages(
  microbenchmark(read.csv(path), read_csv(path))
)

# From Sean Lahman's Baseball Database

baseball <- "Teams.csv"

teams <- read_csv(baseball)

suppressMessages(
  microbenchmark(read.csv(baseball), read_csv(baseball))
)