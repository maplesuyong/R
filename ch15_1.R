library(readxl)
kbo <- read_excel("D:/easy_r/kbo2018.xlsx")
kbo
kbo[]
kbo[1,4]
kbo[5,]
kbo[5]
kbo[,5]

kbo[kbo$whip >= 1.3 & kbo$whip <= 1.4,]
kbo[kbo$whip >= 1.3 & kbo$whip <= 1.4]

kbo[,"team"]
kbo["team",]

kbo[,c("team", "era", "win")]
kbo[c("team", "era", "win"),]
kbo[kbo$whip <= 1.3, c("player", "win")]



library(dplyr)
kbo %>% filter(whip >= 1.3 & whip <= 1.4 & era >= 3.5) %>% group_by(team) %>% summarise(mean_strout = mean(strout))

aggregate(data=kbo[kbo$whip >= 1.3 & kbo$whip <= 1.4 & kbo$era >= 3.5,], team~player, mean(kbo$strout))
kbo$mean_strout <- mean(kbo$strout)
kbo[kbo$whip >= 1.3 & kbo$whip <= 1.4 & kbo$era >= 3.5,c("player", "team")]
aggregate(data=kbo[kbo$whip >= 1.3 & kbo$whip <= 1.4 & kbo$era >= 3.5,], strout~team, mean)



mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
  mutate(tot = (cty + hwy)/2) %>%
  filter(class == "compact" | class == "suv") %>% 
  group_by(class) %>% 
  summarise(mean_tot = mean(tot))

mpg$tot <- (mpg$cty + mpg$hwy)/2
aggregate(data=mpg[mpg$class == "compact" | mpg$class == "suv",], tot~class, mean)
