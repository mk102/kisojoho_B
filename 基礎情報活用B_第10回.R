#練習問題
#(1)
library(PASWR)
x <- subset(iris, Species=="virginica")
x
z.test( x$Sepal.Length, sigma.x=sqrt(0.4), conf.level=0.99)
#(2)
t.test(x$Sepal.Length, conf.level=0.9)
#(3)
(h.sig <- var(x$Sepal.Length))
(N <- length(x$Sepal.Length))
(N-1)*h.sig/qchisq(1-0.025, N-1)
(N-1)*h.sig/qchisq(0.025, N-1)

#母分散の区間推定
rei01 <- read.csv("rei0615.csv")
(h.sig <- var(rei01$time))
9*h.sig/qchisq(1-0.025,9)
9*h.sig/qchisq(0.025, 9)

#例題
rei1 <- c(118, 118, 121, 117, 120) #データ入力
(bar.x <- mean(rei1)) #標本平均
(t0 <- (bar.x-120)/sqrt(4/length(rei1)))
qnorm(0.05) #下側5％点
pnorm(t0) #例題のp値

toi <- c(980, 1050, 1100, 990) #データ入力
(bar.x2 <- mean(toi)) #標本平均
(t02 <- (bar.x2-1000)/sqrt(100^2/length(toi)))
qnorm(0.01/2, lower.tail=F)
2*pnorm(abs(t02), lower.tail=F)

#Rでz検定
#z.test(data, mu=**, sigma.x=**, altenative="***")
library(PASWR)
z.test(rei1, mu=120, sigma.x=2, alternative="less")

#Rでt検定
#t.test(data, mu=** , altenative="***")
t.test(data, mu=xxx)

#練習問題
#(1)
(x <- subset(iris, Species=="setosa"))
z.test(x$Sepal.Length, mu=5.0, sigma.x=sqrt(0.11), alternative="less")
#(2)
t.test(x$Sepal.Length, mu=5.5, alternative = "two.sided")
#(3)
t.test(x$Sepal.Length, mu=4.8, alternative = "greater")
