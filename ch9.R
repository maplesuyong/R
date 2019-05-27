install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
korea <- read.spss(file = "D:/easy_r/Koweps_hpc10_2015_beta1.sav", to.data.frame = T)
korea_copy <- korea
korea_copy
head(korea_copy)
View(korea_copy)
dim(korea_copy)
summary(korea_copy)

korea_copy <-rename(korea_copy,
                    sex = h10_g3,
                    birth = h10_g4,
                    marriage = h10_g10,
                    religion = h10_g11,
                    income = p1002_8aq1,
                    code_job = h10_eco9,
                    code_region = h10_reg7)

class(korea_copy$sex)
table(korea_copy$sex)
korea_copy$sex <- ifelse(korea_copy$sex == 1, "male", "female")
table(korea_copy$sex)

class(korea_copy$income)
summary(korea_copy$income)
qplot(korea_copy$income)
korea_copy$income <- ifelse(korea_copy$income == 0, NA, korea_copy$income)
table(is.na(korea_copy$income))

sex_income <- korea_copy %>% filter(!is.na(income)) %>% group_by(sex) %>% summarise(mean_income = mean(income))
sex_income
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()


class(korea_copy$birth)
summary(korea_copy$birth)
table(is.na(korea_copy$birth))

korea_copy$age <- 2015 - korea_copy$birth + 1
summary(korea_copy$age)

age_income <- korea_copy %>% filter(!is.na(income)) %>% group_by(age) %>% summarise(mean_income = mean(income))
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()


korea_copy <- korea_copy %>% mutate(ageg = ifelse(age < 30, "초년", ifelse(age <= 59, "중년", "노년")))
table(korea_copy$ageg)

ageg_income <- korea_copy %>% filter(!is.na(income)) %>% group_by(ageg) %>% summarise(mean_income = mean(income))
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col() + scale_x_discrete(limits = c("초년", "중년", "노년"))


sex_income_ageg <- korea_copy %>% filter(!is.na(income)) %>% group_by(ageg, sex) %>% summarise(mean_income = mean(income))
ggplot(data = sex_income_ageg, aes(x = ageg, y = mean_income, fill = sex)) + geom_col() + scale_x_discrete(limits = c("초년", "중년", "노년"))
ggplot(data = sex_income_ageg, aes(x = ageg, y = mean_income, fill = sex)) + geom_col(position = "dodge") + scale_x_discrete(limits = c("초년", "중년", "노년"))

sex_income_age <- korea_copy %>% filter(!is.na(income)) %>% group_by(age, sex) %>% summarise(mean_income = mean(income))
ggplot(data = sex_income_age, aes(x = age, y = mean_income, col = sex)) + geom_line()


class(korea_copy$code_job)
table(korea_copy$code_job)

library(readxl)
list_job <- read_excel("D:/easy_r/Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)
dim(list_job)


korea_copy <- left_join(korea_copy, list_job, id = "code_job")
korea_copy %>% filter(!is.na(code_job)) %>% select(code_job, job) %>% head(10)
table(!is.na(korea_copy$job))

job_income <- korea_copy %>% filter(!is.na(income) & !is.na(job)) %>% group_by(job) %>% summarise(mean_income = mean(income))

job_income_top10 <- job_income %>% arrange(desc(mean_income)) %>% head(10)

job_income_top10


ggplot(data = job_income_top10, aes(x = job, y = mean_income)) + geom_col()
ggplot(data = job_income_top10, aes(x = mean_income, y = job)) + geom_col()

ggplot(data = job_income_top10, aes(x = reorder(job, -mean_income), y = mean_income)) + geom_col() + coord_flip()


job_income_bot10 <- job_income %>% arrange(mean_income) %>% head(10)
job_income_bot10

ggplot(data = job_income_bot10, aes(x = reorder(job, mean_income), y = mean_income)) + geom_col() + coord_flip()


job_male <- korea_copy %>% filter(!is.na(job) & sex == "male") %>% group_by(job) %>% summarise(male_n = n()) %>% arrange(desc(male_n)) %>% head(10) 

ggplot(data = job_male, aes(x = reorder(job, male_n), y = male_n)) + geom_col() + coord_flip()


job_female <- korea_copy %>% filter(!is.na(job) & sex == "female") %>% group_by(job) %>% summarise(female_n = n()) %>% arrange(desc(female_n)) %>% head(10) 

ggplot(data = job_female, aes(x = reorder(job, female_n), y = female_n)) + geom_col() + coord_flip()



class(korea_copy$religion)
table(korea_copy$religion)
korea_copy$religion <- ifelse(korea_copy$religion == 1, "yes", "no")
table(korea_copy$religion)

class(korea_copy$marriage)
table(korea_copy$marriage)

korea_copy$doyoumarriage <- ifelse(korea_copy$marriage == 1, "marriage", ifelse(korea_copy$marriage == 3, "divorce", NA))
table(korea_copy$doyoumarriage)
table(is.na(korea_copy$doyoumarriage))


religion_marriage <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% group_by(religion, doyoumarriage) %>% summarise(n = n()) %>% mutate(sum_n = sum(n)) %>% mutate(ratio = round(n/sum_n*100, 1))

religion_marriage


religion_marriage_count <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% count(religion, doyoumarriage) %>% group_by(religion) %>% mutate(ratio = round(n/sum(n)*100, 1))
religion_marriage_count <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% count(religion, doyoumarriage) %>% group_by(doyoumarriage) %>% mutate(ratio = round(n/sum(n)*100, 1))
religion_marriage_count <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% count(religion, doyoumarriage) %>% group_by(religion, doyoumarriage) %>% mutate(ratio = round(n/sum(n)*100, 1))
religion_marriage_count <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% count(religion, doyoumarriage) %>% mutate(ratio = round(n/sum(n)*100, 1))

religion_marriage_count


religion_divorce_ratio <- religion_marriage %>% filter(doyoumarriage == "divorce") %>% select(religion, ratio)
religion_divorce_ratio

ggplot(data = religion_divorce_ratio, aes(x = religion, y = ratio)) + geom_col()


ageg_marriage <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% group_by(ageg, doyoumarriage) %>% summarise(n = n()) %>% mutate(sum_n = sum(n)) %>% mutate(ratio = round(n/sum_n*100, 1))

ageg_marriage


ageg_marriage_count <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% count(ageg, doyoumarriage) %>% group_by(ageg) %>% mutate(ratio = round(n/sum(n)*100, 1))

ageg_marriage_count


ageg_divorce <- ageg_marriage %>% filter(doyoumarriage == "divorce") %>% select(ageg, ratio)
ageg_divorce
ggplot(data = ageg_divorce, aes(x = reorder(ageg, ratio), y = ratio)) + geom_col()



ageg_religion_marriage <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% group_by(ageg, religion, doyoumarriage) %>% summarise(n = n()) %>% mutate(sum_n = sum(n)) %>% mutate(ratio = round(n/sum_n*100, 1))
ageg_religion_marriage


ageg_religion_marriage_count <- korea_copy %>% filter(!is.na(doyoumarriage)) %>% count(ageg, religion, doyoumarriage) %>% group_by(ageg, religion) %>% mutate(ratio = round(n/sum(n)*100, 1))
ageg_religion_marriage_count

ageg_religion_divorce <- ageg_religion_marriage %>% filter(doyoumarriage == "divorce") %>% select(ageg, religion, ratio)
ageg_religion_divorce


ggplot(data = ageg_religion_divorce, aes(x = reorder(ageg, ratio), y = ratio, fill = religion)) + geom_col(position = "dodge")



class(korea_copy$code_region)
table(korea_copy$code_region)

list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region
korea_copy <- left_join(korea_copy, list_region, id = "code_region")

region_ageg <- korea_copy %>% group_by(region, ageg) %>% summarise(n = n()) %>% mutate(sum_n = sum(n)) %>% mutate(ratio = round(n/sum_n*100, 1))
region_ageg

region_ageg_count <- korea_copy %>% count(region, ageg) %>% group_by(region) %>% mutate(ratio = round(n/sum(n)*100, 1))
region_ageg_count

ggplot(data = region_ageg, aes(x = region, y = ratio, fill = ageg)) + geom_col(position = "dodge")

ggplot(data = region_ageg, aes(x = region, y = ratio, fill = ageg)) + geom_col(position = "dodge") + coord_flip()

ggplot(data = region_ageg, aes(x = region, y = ratio, fill = ageg)) + geom_col() + coord_flip()


list_order_old <- region_ageg %>% filter(ageg == "노년") %>% arrange(ratio)
list_order_old

only_order <- list_order_old$region
only_order

ggplot(data = region_ageg, aes(x = region, y = ratio, fill = ageg)) + geom_col() + coord_flip() + scale_x_discrete(limits = only_order)


list_order_old_reverse <- region_ageg %>% filter(ageg == "노년") %>% arrange(desc(ratio))
list_order_old_reverse

only_order_reverse <- list_order_old_reverse$region
only_order_reverse

ggplot(data = region_ageg, aes(x = region, y = ratio, fill = ageg)) + geom_col() + coord_flip() + scale_x_discrete(limits = only_order_reverse)


class(region_ageg$ageg)
levels(region_ageg$ageg)

region_ageg$ageg <- factor(region_ageg$ageg, level = c("초년", "중년", "노년"))
class(region_ageg$ageg)
levels(region_ageg$ageg)

ggplot(data = region_ageg, aes(x = region, y = ratio, fill = ageg)) + geom_col() + coord_flip() + scale_x_discrete(limits = only_order)
