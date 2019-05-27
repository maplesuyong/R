library(ggplot2)
new <- midwest
new <- midwest %>% mutate(rate = (poptotal-popadults)/poptotal*100)
new %>% select(rate)
new
new %>% group_by(county) %>% select(county, rate) %>% arrange(desc(rate))
summary(new)
newnew <- new %>% mutate(class = ifelse(new$rate >= 40, "large",
                              ifelse(new$rate >= 30 & new$rate < 40, "middle", "small")))
newnew %>% select(county, class)
newnew %>% group_by(class) %>% summarise(n=n())
new <- new %>% mutate(asian_rate = popasian/poptotal*100)
new %>% select(state, county, asian_rate) %>% arrange(asian_rate) %>% head(10)
