install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")
library(KoNLP)
library(rJava)
Sys.getenv("JAVA_HOME")

useNIADIC()

Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk-12.0.1")
