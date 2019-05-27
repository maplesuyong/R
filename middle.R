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


table(df$신용도)
table(df$주택소유)
df2 <- df %>% filter((신용도 == 0 | 신용도 == 1 | 신용도 == 2) & (주택소유 == 0 | 주택소유 == 1) & (연령 >=20 & 연령 <= 60) & (집세 >= 100)) %>% select(고객번호, 주택소유, 집세, 수입, 연령,고객년수, 근무년수, 신용도)

df2 %>% filter(신용도 == 0) %>% arrange(desc(근무년수)) %>% arrange(desc(수입)) %>% arrange(desc(고객년수))

df2 %>% filter(신용도 == 1) %>% arrange(desc(고객년수)) %>% arrange(desc(근무년수)) %>% arrange(desc(수입))

df2 %>% filter(신용도 == 2 & 주택소유 == 1) %>% arrange(desc(근무년수)) %>% arrange(desc(수입))

ggplot(data = df2, aes(x = 수입)) + geom_bar()
mean(df2$수입)

