library(tidyverse)

name = "Brian"

str_glue("My name is {name}")

str_c("My name is ", name, sep = "")

# str_glue is part of stringr, so we get it included with tidyverse
# for other glue functionality, we need to load glue (not in 'core tidyverse')

library(glue)

glue("Today is {Sys.Date()}")

# or more readable

glue("Today is {format(Sys.Date(), '%A, %B %d, %Y')}")

head(iris) %>%
  mutate(description = glue("This {Species} has a petal length of {Petal.Length}"))

glue("My name is {name}, not {{name}}.")

# the { } braces in glue act sort of like / in normal string operations and need to be "escaped" to get
# that actual character { to show up




