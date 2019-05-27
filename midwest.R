df_midwest <- as.data.frame(ggplot2::midwest)
library(dplyr)
df_midwest <- rename(df_midwest, total = poptotal, asian = popasian)
df_midwest
df_midwest$rate <- (df_midwest$asian/df_midwest$total)*100
hist(df_midwest$rate)
mean(df_midwest$rate)
df_midwest$value <- ifelse(df_midwest$rate > 0.4872462, "large", "small")
head(df_midwest)
table(df_midwest$value)
library(ggplot2)
qplot(df_midwest$value)
