library("dplyr")
library("ggplot2")
library("caTools")

train_data <- read.csv("train_data.csv")
test_data <- read.csv("test_data.csv")

# on train data 
model <- lm(formula = log_area ~ temp*FFMC*DMC*ISI, data = train_data)
summary(model)
train_mse_5 <- mean(model$residuals^2)

pred <- predict(model, test_data, interval="prediction")
pred <- data.frame(pred)

true <- data.frame(fit = test_data$log_area)

test_mse_5 <- mean((true$fit - pred$fit)^2)
xaxis <- c(1:length(true$fit))

true$xaxis <- xaxis
true$group <- "true"
pred$xaxis <- xaxis
pred$group <- "pred"
res <- rbind(true, pred[c("xaxis", "fit", "group")])

ggplot(res, aes(x = xaxis, y = fit, group = group, fill = group, col = group)) +
  geom_point()