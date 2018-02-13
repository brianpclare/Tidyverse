library(tidyverse)

# Let's try to replicate this graph
# https://www.r-graph-gallery.com/wp-content/uploads/2015/09/4_barplot_with_IC1.png

data <- as.tibble(matrix( c(10, 11, 9, 9.5, 2, 5), nrow = 3, byrow = TRUE))

colnames(data) <- c("poacee", "sorgho")
data$cond <- c("cond_A", "cond_B", "cond_C")

ggplot(data = data) + geom_col(mapping = aes(x = cond, y = ), position = "dodge")


# Why isn't this going to work?











# Tidy data - each row is an observation, each column is a variable
# This data has 6 observations, so a tidy table should have 6 rows

values <- c(10, 11, 9, 9.5, 2, 5)
conds <- c("cond_A", "cond_A", "cond_B", "cond_B", "cond_C", "cond_C")
types <- c("poacee", "sorgho", "poacee", "sorgho", "poacee", "sorgho")

tdata <- as.tibble(cbind(conds, types, values))

ggplot(data = tdata) + geom_col(mapping = aes(x = conds, y = values, color = types), position = "dodge")

ggplot(data = tdata) + geom_col(mapping = aes(x = conds, y = values, fill = types), position = "dodge")

# What the heck is going on with the y-axis



# To-do list
## Fix colors
## Add error bars
## change y label, add x label
## Move / fix legend
## Black borders?




# Where to put the data = ?

ggplot(data = storms) + geom_point(mapping = aes(x = long, y = lat, color = wind))

ggplot(data = storms, mapping = aes(x = long, y = lat, color = wind)) + geom_point()

ggplot() + geom_point(data = storms, mapping = aes(x = long, y = lat, color = wind)) + 
  geom_smooth(data = filter(storms, name == "Sandy"), mapping = aes(x = long, y = lat), color = "red") +
  geom_smooth(data = filter(storms, name == "Katrina"), mapping = aes(x = long, y = lat), color = "black")

ggplot(data = storms, mapping = aes(x = long, y = lat)) + geom_point(aes(color = wind)) + 
  geom_smooth(data = filter(storms, name == "Andrew"), color = "red") +
  geom_smooth(data = filter(storms, name == "Wilma"), color = "black")

ggplot(data = storms) + geom_point(mapping = aes(x = lat, y = ts_diameter))

ggplot(data = storms) + geom_point(mapping = aes(x = long, y = status))

ggplot(data = storms) + geom_jitter(mapping = aes(x = long, y = status))
