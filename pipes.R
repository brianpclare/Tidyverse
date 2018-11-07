library(tidyverse)
library(magrittr)


# simple pipe
iris %>% filter(Species == "versicolor")
# the same as
filter(iris, Species == "versicolor")


# pipe and assign back
sample <- iris

sample %<>% filter(Species == "versicolor")
# the same as
sample <- iris
sample <- sample %>% filter(Species == "versicolor")
rm(sample)

# exposition pipe
iris %>%
  subset(Sepal.Length > mean(Sepal.Length)) %$%
  cor(Sepal.Length, Sepal.Width)

# same as
sample2 <- iris %>%
  subset(Sepal.Length > mean(Sepal.Length))

cor(sample2$Sepal.Length, sample2$Sepal.Width)
rm(sample2)


# tee operator: pipe but return this, not the result
set.seed(5)
rnorm(200) %>%
  matrix(ncol = 2) %T>%
  plot %>% # plot usually does not return anything.
  colSums

# so this plots, then keeps going and gives column sums, normally you can't pipe from plot

# same as
set.seed(5)

sample3 <- rnorm(200) %>%
  matrix(ncol = 2)

plot(sample3)
colSums(sample3)


