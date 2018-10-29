library(tidyverse)
library(readxl)

# writing to xlsx, especially to different sheets
library(openxlsx)

# the package "xlsx" is also usable but has a java dependency that can be annoying for installation


# So, about strings

# library(stringr)

# Stringr cheatsheet is available on RStudio's website, or in this github repo

str1 <- "This is a string"
str2 <- "This is also a string"

str_detect(str1, "a")
str_detect(str1, "also")
str_detect(str2, "also")

str_to_upper(str1)
str_to_title(str1)

x <- c("1", "2", "3", "4", "5")
y <- c("a", "b", "c", "d", "e")

combined <- str_c(x, y, sep = "")
combined2 <- str_c(x, y, sep = "-")

# Regular Expressions (regex)

str_count(str2, "a")
str_count(str2, " a ")

str3 <- "Tom said we'll have time to read a tame tome at the bottom of the well"

str_count(str3, "tom")
str_count(str3, "t.m") # . is a wildcard

# One advantage of stringr instead of base R string operations is
# that stringr functions work with pipes

str3 %>% str_to_lower() %>% str_count("t.m")

str3 %>% str_to_lower() %>% str_count("t[oi]m") # [] means any of the characters inside

# [xyz] will match any one of those characters
# We can use that to match cases as well if we don't want the whole string changed to lower

str3 %>% str_count("[Tt]om")

str4 <- "Food, fooooood. FOOOOOOOOOOOOD!"

str4 %>% str_to_lower() %>% str_count("fo{2,}d") # 2 or more


str4 %>% str_to_lower() %>% str_extract("[[:punct:]]") # only takes the first match
str4 %>% str_to_lower() %>% str_extract_all("[[:punct:]]")

str4 %>% str_count(".")









str4 %>% str_count("\\.")

# Like how you need to double the [], often in R you need to double escape \\ instead of \

str5 <- "this
is
a
terrible
poem"

str5 %>% str_count("\n")


# Let's look at the storms data again
storms

# Beginning or end of string

As <- storms %>% filter(str_detect(name, "^A")) %>% select(name, year) %>% unique()

Ms <- storms %>% filter(str_detect(name, "^M")) %>% select(name, year) %>% unique()

end_Ws <- storms %>% filter(str_detect(name, "w$")) %>% select(name, year) %>% unique()



# Regular Expressions can get pretty messy

rnum <- "XCVIIII"

rnum %>% str_detect("^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$")
