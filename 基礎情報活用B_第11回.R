#練習問題
#(1)
library(PASWR)
x <- subset(iris, Species=="setosa")
z.test(x$Sepal.Width, mu=3.0, sigma.x=sqrt(0.2))
#(2)
t.test(x$Sepal.Width, mu=3.0, alternative = "greater")

A <- c(9.6, 9.7, 10.2, 10.0, 10.1, 10.0, 9.7, 9.9)
B <- c(9.9, 9.9, 10.1, 10.0, 10.0, 10.1)
(z0 <- (mean(A)-mean(B))/sqrt((0.2^2/length(A))+(0.1^2/length(B))))
qnorm(0.05/2, lower.tail=F) 
2*pnorm(abs(z0), lower.tail=F) #p値

data_var <- 1/(8+6-2)*((7*var(A))+(5*var(B)))
(t0 <- (mean(A) - mean(B))/sqrt((1/8 + 1/6)*data_var))
qt(0.05/2, 12, lower.tail = F)
2*pt(abs(t0), 12, lower.tail = F) #p値

# Rで平均差の検定
#t.test(data1, data2, var.equal=T, altenative="***")
#等分散性を仮定しない平均差の検定（ウェルチの検定）はvar.equal=F

#分散既知ならz.test
t.test(A, B, var.equal=T)
z.test(A, B, sigma.x=0.2, sigma.y=0.1)

#等分散性の検定
(f0 <- var(A)/var(B))　#検定統計量
qf( 0.05, 7, 5, lower.tail=F)

pf(abs(f0), 7, 5, lower.tail=F) #p値

#RでF検定
#var.test(data1, data2, altenative="***")
var.test(A, B, alternative = "greater")

