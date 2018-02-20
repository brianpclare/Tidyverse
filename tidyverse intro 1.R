# Let's look at our datasets

data()

# Let's get some more datasets

library(tidyverse)

data()

storms

# Notice how we don't have all 10,010 rows flooding the console

# Let's look at the names of hurricanes with wind speed over 120 mph

fast <- filter(storms, wind > 120)
fast_names <- select(fast, name, year)
fast_names_unique <- unique(fast_names)

# Or all in one line

fast_names_unique_2 <- unique(select(filter(storms, wind > 120), name, year))

# Parentheses can be very annoying here

# Pipes!

# Ctrl-Shift-m: %>% 

fast_names_unique_3 <- storms %>% filter(wind > 120) %>%  select(name, year) %>%
                                  unique()

# Note: the () are not necessary for unique but it's nice to have them for clarity

major_storms <- fast_names_unique_3 %>% group_by(year) %>% summarize(Number = n()) %>%
                                        arrange(desc(Number))


ex <- fast_names_unique_3 %>% select(year)

ex2 <- storms %>% group_by(year, category)
