install.packages("plotly")
library(plotly)
library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
p
ggplotly(p)

p_dia <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")
ggplotly(p_dia)


install.packages("dygraphs")
library(dygraphs)
economics <- ggplot2::economics
head(economics)

library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)
dygraph(eco)
dygraph(eco) %>% dyRangeSelector()

eco_a <- xts(economics$psavert, order.by = economics$date)
eco_b <- xts(economics$unemploy, order.by = economics$date)

eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "unemploy")
head(eco2)

dygraph(eco2) %>% dyRangeSelector()
