library("ggplot2")
library("dplyr")

train_data <- read.csv("train_data.csv")
test_data <- read.csv("test_data.csv")

zero_train_data <- train_data %>% filter(log_area > 0)
zero_test_data <- test_data %>% filter(log_area > 0)

ggplot(test_data, aes(x=temp, y=log_area)) +
  geom_point()
