library(tidyverse)

# let's take a simple plot in ggplot

data(iris)
ggplot(data = iris) + geom_point(aes(x = Sepal.Length, y = Petal.Length, color = Species))

# Now let's make this look nicer
# https://ggplot2.tidyverse.org/reference/theme.html

ggplot(data = iris) + geom_point(aes(x = Sepal.Length, y = Petal.Length, color = Species),
                                 size = 3) +
  theme(
    axis.line = element_line(arrow = arrow()),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  )

# install.packages("extrafont")
library(extrafont)

# the next step you only should need to do once, and it takes a few minutes
# font_import(paths = NULL, recursive = TRUE, prompt = TRUE,pattern = NULL)

extrafont::loadfonts(device="win")
library(ggplot2)

fonts()

# I wouldn't actually suggest using these fonts, I'm just using them as examples because they're distinctive
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(data = iris) + geom_point(aes(x = Sepal.Length, y = Petal.Length, color = Species),
                                 size = 4) +
  theme(
    axis.line = element_line(arrow = arrow()),
    axis.title.x = element_text(face = "bold", family = "Impact", size = 12),
    axis.title.y = element_text(face = "bold", family = "Rockwell", size = rel(1.5)),
    legend.text = element_text(size = rel(1.5)),
    legend.title = element_text(size = rel(1.8))
  ) +
  scale_x_discrete(name = "Sepal Length", limits = seq(4, 8, 0.5)) +
  scale_y_discrete(name = "Petal Length", limits = seq(0, 7, 1)) + 
  scale_color_manual(values = cbbPalette)
  
