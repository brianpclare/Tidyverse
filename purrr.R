library(tidyverse)
# install.packages("repurrrsive")
library(repurrrsive)

# The tidyverse package purrr is described as dplyr but for lists instead of dataframes
# purrr has functions that can do about the same things as the apply family in base R

# Hadley Wickham explaining purrr::map vs apply
# https://stackoverflow.com/questions/45101045/why-use-purrrmap-instead-of-lapply



# With apply

mtcars %>% 
  split(.$cyl) %>% 
  lapply(function(x) lm(mpg~wt, data = x)) %>% 
  lapply(summary) %>% 
  sapply(function(x) x$r.squared)

# With purrr

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")

# repurrrsive gives us some nice list examples, such as got_chars

View(got_chars)
got_chars[1]

# apply and map both use anonymous functions
# see also: lambda calculus (lambda functions in python)

lapply(got_chars[1:3],
       function(x) x[["name"]])

map(got_chars[1:3], "name")

# Name is the 3rd element of each character's list, so we could also do

map(got_chars[1:3], 3)

# We can also use pipes here
# Map pipes well because the first argument is the data, apply functions don't all work like that

got_chars[1:3] %>% map(3)
got_chars %>% map(alive == TRUE)


# map_df can take a list of lists and return a dataframe (a tibble)

map_df(got_chars, extract, c("name", "culture", "gender", "id", "born", "alive"))
