library(tidyverse)

#http://adv-r.had.co.nz/Exceptions-Debugging.html

# When your code isn't doing what you expect it to do, you have a bug
# It might be refusing to run entirely, or just giving a wrong output

If your code doesn't run, look for the red x on the left side of rstudio's interface

# Locate the problem. Sometimes the red x makes this easy, other times it doesn't locate the real problem

# Run your code in small pieces and check the output each step until you find the problem

# example from Advanced R

f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(c)
i <- function(d) "a" + d
f(10)

traceback()
?stop

try({f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(c)
i <- function(d) "a" + d
f(10)})


f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(c)
i <- function(d) "a" + d
try(f(10))

try(1 + 2)
1 + 2


# Optimization

# http://adv-r.had.co.nz/Performance.html

library(microbenchmark)

# by default microbenchmark runs 100 times

u <- runif(100)
microbenchmark(
  sqrt(u),
  u ^ 0.5, 
  times = 1000
)

# R lets you change almost anything you want, but that slows it down 
# because it has to keep checking every step of the way

a <- 0L               # How is this different from a <- 0 ?
for (i in 1:1e6) {
  a <- a + 1
}

# The operation '+' is defined in several ways depending on what object types are being used
# + on integers, numbers, booleans (True / False) etc
# So for every step of this loop, R has to decide which '+' you want it to use



# Small note: I'm trying not to reuse variable names, 
# so you can go through and re-run any part of this code and it will still work

# Often in R there are many ways to do the same thing, even without including new packages
# It's good to learn which ways are faster

microbenchmark(
  "[32, 11]"      = mtcars[32, 11],
  "$carb[32]"     = mtcars$carb[32],
  "[[c(11, 32)]]" = mtcars[[c(11, 32)]],
  "[[11]][32]"    = mtcars[[11]][32],
  ".subset2"      = .subset2(mtcars, 11)[32]
)


