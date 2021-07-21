library("dplyr")
library("ggplot2")
library("caTools")

data <- read.csv("forestfires.csv")
data$log_area <- log(data$area + 1)

av <- aov(formula = log_area ~ month, data=(data %>% filter(month != "sep" & month != "aug")))
summary(av)

TukeyHSD(av, conf.level = 0.9)

# temp*DC
# temp*DMC
# temp*wind
