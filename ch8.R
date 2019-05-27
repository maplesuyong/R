library(ggplot2)
library(dplyr)
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
mpg
df_mpg <- mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy))
df_mpg
ggplot(data = df_mpg, aes(x = reorder(drv, mean_hwy), y = mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, mean_hwy), y = mean_hwy)) + geom_bar()
ggplot(data = df_mpg, aes(x = drv)) + geom_col()
economics
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
ggplot(data = mpg, aes(x=cty, y= hwy)) + geom_point()
ggplot(data = midwest, aes(x=poptotal, y=popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000)
mpg_q3 <- mpg %>% filter(class == "suv") %>% group_by(manufacturer) %>% summarise(mean_cty = mean(cty)) %>% arrange(desc(mean_cty)) %>% head(5)
ggplot(data = mpg_q3, aes(x=reorder(manufacturer, mean_cty), y=mean_cty)) + geom_col()
ggplot(data = mpg, aes(x=class)) + geom_bar()
ggplot(data = economics, aes(x=date, y=psavert)) + geom_line()
mpg_q6 <- mpg %>% filter(class == "compact" | class == "subcompact" | class == "suv")
mpg_q6
ggplot(data = mpg_q6, aes(x=class, y=cty)) + geom_boxplot()

