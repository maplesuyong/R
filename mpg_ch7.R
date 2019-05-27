library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
table(is.na(mpg$hwy))
table(is.na(mpg$drv))
mpg2 <- mpg
mpg2[c(65,124,131,153,212), "hwy"] <- NA
table(is.na(mpg2$hwy))
table(is.na(mpg2$drv))
mpg2 %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy))
mpg3 <- mpg
mpg3[c(10, 14, 58,93), "drv"] <- "k"
mpg3[c(29,43,129,203), "cty"] <- c(3,4,39,42)
table(mpg3$drv)
mpg3$drv <- ifelse(mpg3$drv %in% c("4", "f", "r"), mpg3$drv, NA)
table(mpg3$drv)
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg3$cty <- ifelse(mpg3$cty >= 9 & mpg3$cty <= 26, mpg3$cty, NA)
table(mpg3$cty)
boxplot(mpg3$cty)
mpg3 %>% filter(!is.na(drv) & !is.na(cty)) %>% group_by(drv) %>% summarise(mean_cty = mean(cty))

