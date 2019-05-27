a <- c(1,2)
a

b <- "hello"
b

class(a)
class(b)

class(mpg)

mmm <- matrix(c(1:8), ncol = 2)
mmm

mmm_1 <- matrix(c(1:9), ncol = 3)
mmm_1

mmm_2 <- matrix(c(1:9), ncol = 2)
mmm_2

mmm_2 <- matrix(c(14,523,6,12,62,1,9,141,523,1,2,89), ncol = 5)
mmm_2

class(mmm_2)



aaa <- array(1:20, dim = c(2,5,2))
aaa

aaa_1 <- array(1:20, dim = c(3,5,2))
aaa_1

class(aaa_1)


LLL <- list(g1 = a,
            g2 = mpg,
            g3 = mmm_1,
            g4 = aaa_1)
LLL
class(LLL)


mpg <- ggplot2::mpg
x <- boxplot(mpg$cty)
x


x$stats[,1]
x$stats[3,]
x$stats[,1][6]
