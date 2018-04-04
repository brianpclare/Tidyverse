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
# note that the . can mean "all columns" in a linear model, or similarly "the data we've been using"
# split() returns a list of dataframes

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")



# repurrrsive gives us some nice list examples, such as got_chars
# If you're a game of thrones fan, please note this list of characters and traits
# is based on the books, the TV show would be a little different

# So, you know, spoiler alert

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
alive <- got_chars[got_chars %>% map("alive") == TRUE] %>% map("name")
dead <- got_chars[got_chars %>% map("alive") == FALSE] %>% map("name")

alive <- tibble(alive)
colnames(alive) <- "Name"
alive$status <- "Alive"

dead <- tibble(dead)
colnames(dead) <- "Name"
dead$status <- "Dead"

status <- bind_rows(alive, dead)

status %>% ggplot(aes(x = status)) + geom_bar()

# Did you know you could pipe %>% into ggplot? Sometimes useful
# It's a little annoying to go %>% into +
# ggvis is a package that is in some ways an updated ggplot that uses %>%  and never +
# But ggplot is still pretty much the standard graph package for R


# That was a lot of work from those lists to make a simple bar plot though, right?


# map_df can take a list of lists and return a dataframe (a tibble)

status2 <- map_df(got_chars, magrittr::extract, c("name", "alive"))

# Let's turn the true and false into alive and dead though

status2$alive <- ifelse(status2$alive, "Alive", "Dead")


# extract is a function in tidyr and in magrittr, if you don't specify then R tries the function
# from tidyr and gives you an error, so we specify magrittr and it works fine

# Alternate version from base R
# This can be hard to type in correctly because of the ``s

status3 <- map_df(got_chars, `[`, c("name", "alive"))

