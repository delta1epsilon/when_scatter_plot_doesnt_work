library(ggplot2)
library(viridis)
set.seed(2017)

## Generate data set with patterns
# (0, 0) samples
x <- rep(0, 1000000)
y <- rep(0, 1000000)

# 2 lines
line <- runif(500000, 0.5, 2)
x <- c(x, line)
y <- c(y, 4 - line)
x <- c(x, line)
y <- c(y, 2.5 - line)

x <- c(x, rexp(1000000, rate = 2))
y <- c(y, rexp(1000000))

x <- c(x, runif(300000, 0, 6))
y <- c(y, rexp(300000, 5))

x <- c(x, rexp(30000, 6))
y <- c(y, runif(30000, 0, 12))


## Plots
# scatterplot
ggplot() + 
    geom_point(aes(x = x, y = y), 
               colour = 'steelblue'
               )
               
# change alpha
ggplot() + 
    geom_point(aes(x = x, y = y), 
               colour = 'steelblue', 
               alpha = 0.1
               )
               
# Hex Bins
ggplot() + 
    stat_binhex(aes(x = x, y = y)) +
    scale_fill_gradientn(colours = viridis(256), 
                         trans = 'log10', 
                         limits=c(1, 200000),
                         name = 'log10(count)'
                         )
               
