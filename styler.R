## let's look at some poorly styled code

x <- 15
y <- 2
for (i in 1:20) {
  if (i == 2) {
    x <- 10
    y <- x^2
  } else {
    y <- 8
  }
}



# style guides
# https://google.github.io/styleguide/Rguide.xml
# http://style.tidyverse.org/
