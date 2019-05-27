library(ggplot2)
library(dplyr)
mpg
mpg %>% filter(displ <= 4)
mpg %>% filter(displ >= 5)
base1 <- mpg %>% filter(displ <= 4)
base2 <- mpg %>% filter(displ >= 5)
mean(base1$hwy)
mean(base2$hwy)
mpg
base3 <- mpg %>% filter(manufacturer == "audi")
base4 <- mpg %>% filter(manufacturer == "toyota")
mean(base3$cty)
mean(base4$cty)

base5 <- mpg %>% filter(manufacturer == "chevrolet")
base6 <- mpg %>% filter(manufacturer == "ford")
base7 <- mpg %>% filter(manufacturer == "honda")
mean(base5$hwy)
mean(base6$hwy)
mean(base7$hwy)

base8 <- mpg %>% select(class, cty)
base8

base9 <- base8 %>% filter(class == "suv")
base10 <- base8 %>% filter(class == "compact")
mean(base9$cty)
mean(base10$cty)

base11 <- mpg %>% filter(manufacturer == "audi")
base11 %>% select(model, hwy) %>% head(5)

new <- mpg
new %>% mutate(sum = cty+hwy)
new <- new %>% mutate(sum1 = (cty+hwy)/2)
new
new %>% arrange(desc(sum1))

mpg %>% mutate(sum = cty+hwy,
               sum1 = (cty+hwy)/2) %>% arrange(desc(sum1))

mpg %>% 
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>% 
  arrange(mean_cty)

mpg %>% 
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

mpg %>% 
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy))

mpg %>% 
  group_by(manufacturer) %>%
  filter(class == "compact") %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   class_fl = c("CNG", "diesel", "ethanol E85", "premium", "regular"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel
final <- left_join(mpg, fuel, by = "fl")
final
final %>% select(model, fl, price_fl) %>% head(5)
