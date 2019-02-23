#中心極限定理をシミュレートする
func1 <- function(n) mean(rpois(n, 2))
result2 <- sapply(rep(500,1000), func1)
hist((result2 - 2)/sqrt(2/500))
curve(dnorm, col=2, add=T)

#練習問題
#(1)
set.seed(608)
func2 <- function(n) mean(runif(n))
result3 <- sapply(1:10000, func2)
plot(result3)

#(2)
set.seed(608)
kadai2 <- sapply(rep(5000, 1000), func2)
mean(abs(kadai2 - 0.5) >= 0.01)

#(3)
hist((kadai2-0.5)/sqrt(1/(12*5000)),freq=F,ylim=(0.0.4))

#カイ二乗分布
curve(dchisq(x, 1), 0, 8, ylim=c(0,0.5))
curve(dchisq(x, 4), 0, 8, col=2, add=T)
curve(dchisq(x, 6), 0, 8, col=2, add=T)
qchisq(0.05, 6) #下側5％点
qchisq(0.05, 6, lower.tail=F) #上側5％点

#t分布
curve(dt(x, 1), -4, 4, ylim=(c(0,0.5)))
curve(dt(x, 4), -4, 4, col=2, add=T)
curve(dt(x, 6), -4, 4, col=4, add=T)
qt(0.05, 6) #下側5％点
qt(0.05, 6, lower.tail=F) #上側5％点

#練習問題
rei01 <- read.csv("rei0615.csv")
bar.x <- mean(rei01$time)
bar.x + qnorm(0.025)*sqrt(10/10)
bar.x - qnorm(0.025)*sqrt(10/10)

h.sig <- var(rei01$time)
bar.x - qt(1-0.025,9)*sqrt(h.sig/10)
bar.x + qt(1-0.025,9)*sqrt(h.sig/10)

#Rで区間推定
install.packages("PASWR")
t.test(rei01$time)