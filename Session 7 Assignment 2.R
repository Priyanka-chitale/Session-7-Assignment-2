## 1. Write a program to create barplots for all the categorical columns in mtcars.
library(purrr)
library(tidyr)
library(ggplot2)

mtcars %>%
  keep(is.numeric) %>% 
  gather() %>% 
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_bar()

## 2. Create a scatterplot matrix by gear types in mtcars dataset.
# Scatterplot Matrices from the lattice Package 
super.sym <- trellis.par.get("superpose.symbol")
library(lattice)
splom(mtcars[c(1,3,5,6)], groups= mtcars$gear, data=mtcars,
      panel=panel.superpose, 
      key=list(title="Three Gear Options",
               columns=3,
               points=list(pch=super.sym$pch[1:3],
                           col=super.sym$col[1:3]),
               text=list(c("3 Gears","4 Gears","5 Gears"))))

## 3. Write a program to create a plot density by class variable.

library(tidyr)
library(purrr)
library(ggplot2)
d= mtcars
d %>%
  keep(is.numeric) %>%                     # Keep only numeric columns
  gather() %>%                             # Convert to key-value pairs
  ggplot(aes(value)) +                     # Plot the values
  facet_wrap(~ key, scales = "free") +   # In separate panels
  geom_density()                         # as density