#http://dept.stat.lsa.umich.edu/~jerrick/courses/stat701/notes/profiling.html

install.packages("profvis")

library(ggplot2)
library(profvis)
profvis({
  reps <- 10000
  n <- 100
  beta0 <- 2
  beta1 <- .7
  
  save <- vector()
  
  save <- for (i in 1:reps) {
    x <- rnorm(n)
    y <- beta0 + beta1*x + rnorm(n)
    
    # Add rounding. Since we're dealing with standardized data, round to 2 decimals.
    badinterviewer <- sample(1:n, .25*n, replace = FALSE)
    x[badinterviewer] <- ceiling(x[badinterviewer])
    
    coef <- lm(y ~ x)$coef[2]
    save <- c(save, coef)
  }
  save <- data.frame(save)
  ggplot(save, aes(x = save)) + geom_density() + geom_vline(xintercept = beta1)
})
  

# lm is the slow part. Let's do it faster

# Copy the data generating code:
n <- 100
beta0 <- 2
beta1 <- .7
x <- rnorm(n)
y <- beta0 + beta1*x + rnorm(n)

badinterviewer <- sample(1:n, .25*n, replace = FALSE)
x[badinterviewer] <- ceiling(x[badinterviewer])

y <- matrix(y, ncol = 1)
x <- cbind(1, x)
library(microbenchmark)
(mbm <- microbenchmark(lm(y ~ x),
                       solve(t(x) %*% x) %*% (t(x) %*% y),
                       .lm.fit(x, y)))
