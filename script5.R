library(readxl)
df_kbo <- read_excel("kbo2018.xlsx")
df_kbo$strrate <- df_kbo$strout/df_kbo$inning
df_kbo
mean(df_kbo$strrate)
summary(df_kbo$strrate)
hist(df_kbo$strrate)
df_kbo$class <- ifelse(df_kbo$strrate >= 0.9, "S급", "A급")
df_kbo
