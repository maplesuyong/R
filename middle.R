library(ggplot2)
library(readxl)
library(dplyr)
df <- read_excel("D:/easy_r/aaa.xls")
dim(df)
table(is.na(df))
table(is.na(df$))
df %>% filter() %>% group_by %>% summarise()
df %>% filter() %>% group_by %>% summarise(mean_ = mean( , na.rm = T))
df$ <- ifelse(df$, ,)
boxplot(df$)
ggplot(data = df, aes(x=reorder( , ), y=mean_hwy)) + geom_col()


table(df$�ſ뵵)
table(df$���ü���)
df2 <- df %>% filter((�ſ뵵 == 0 | �ſ뵵 == 1 | �ſ뵵 == 2) & (���ü��� == 0 | ���ü��� == 1) & (���� >=20 & ���� <= 60) & (���� >= 100)) %>% select(������ȣ, ���ü���, ����, ����, ����,�������, �ٹ����, �ſ뵵)

df2 %>% filter(�ſ뵵 == 0) %>% arrange(desc(�ٹ����)) %>% arrange(desc(����)) %>% arrange(desc(�������))

df2 %>% filter(�ſ뵵 == 1) %>% arrange(desc(�������)) %>% arrange(desc(�ٹ����)) %>% arrange(desc(����))

df2 %>% filter(�ſ뵵 == 2 & ���ü��� == 1) %>% arrange(desc(�ٹ����)) %>% arrange(desc(����))

ggplot(data = df2, aes(x = ����)) + geom_bar()
mean(df2$����)
