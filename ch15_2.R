var1 <- c(1,2,3,1,2)
var2 <- factor(c(1,2,3,1,2))

var1
var2

var1+1
var2+1

class(var1)
class(var2)

levels(var1)
levels(var2)

var3 <- c("a", "b", "b", "c")
var4 <- factor(c("a", "b", "b", "c"))

var3
var4

class(var3)
class(var4)

mean(var2)

var2 <- as.numeric(var2)
var2
mean(var2)



class(mpg$drv)
mpg$drv <- as.factor(mpg$drv)
mpg$drv
class(mpg$drv)
