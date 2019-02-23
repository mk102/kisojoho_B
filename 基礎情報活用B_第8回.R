#練習問題
#(1)
set.seed(111)
a <- sample(c("H", "T"), 100, replace=TRUE)
table(a)
#(2)
set.seed(111)
sample(1:100, 10)
#(3)
set.seed(111)
b <- runif( 100 )
mean(b)
#(4)
punif( 7, 0, 10)
qunif( 0.95, 0, 10, lower.tail=F)
qunif(1-0.95, 0, 10) #同じ

#正規分布の計算いろいろ
#dnorm(x, m, sd) 密度関数f(x)の値
#pnorm(x, m, sd) P(X <= x)
#qnorm(q, m, sd) P(X <= x) = q
#rnorm(k, m, sd) 正規乱数をk個発生
pnorm(1.96) #下側確率P(Z<1.96)
pnorm(1.96, lower.tail=F) #上側確率P(Z>1.96)
qnorm(0.025, lower.tail=F) #上側2.5％

#Rで正規分布の密度関数
curve(dnorm(x, 0, 1), -4, 4, ylim=c(0, 5)) #左黒
curve(dnorm(x, 0, 2), -4, 4, col=2, add=T) #左赤
curve(dnorm(x, 0, 3), -4, 4, col=4, add=T) #左青
curve(dnorm(x, 0, 1), -4, 4, ylim=c(0, 5)) #右黒
curve(dnorm(x, 1, 1), -4, 4, col=2, add=T) #右赤
curve(dnorm(x, 2, 1), -4, 4, col=4, add=T) #右赤

#練習問題
#問題1
#(1)
pnorm(1)
#(2)
pnorm(2.58, lower.tail = F)
#(3)
qnorm(0.05, lower.tail=F)
#問題2
#(1)
pnorm(1, m=2, sd=4)
#(2)
pnorm(3.8, m=2, sd=4, lower.tail=F)
#(3)
pnorm(4, m=2, sd=4) - pnorm(-3, m=2, sd=4)
#(4)
qnorm( 0.1, m=2, sd=4)
#(5)
qnorm(0.04, m=2, sd=4, lower.tail=F)

#無作為標本の標本平均
#m=2のポアソン分布
set.seed(608) #初期値設定
x <- rpois( 10, 2 ) #Po(2)の標本を10個
x
mean(x)
mean(rpois(1000, 2)) #標本1000個にして平均
mean(rpois(10000, 2))　#標本10000個にして

#繰り返し計算
#関数supplyを用いると，繰り返し演算を手軽に行える行える
#sapply(ベクトル，関数)
sapply(1:5, factorial) #1から5の階乗
sapply(c(2, 4, 5), factorial) #2, 4, 5の階乗
sapply(rep(5, 5), factorial) #5の階乗を5個

#大数の法則
func1 <- function(n) mean(rpois(n,2))
func1(1000) #ポアソン乱数1000個の平均
# 標本数n=10, 100, 1000, 10000, 100000
set.seed(608)
sapply(10^(1:5), func1)
result <- sapply( 1:10000, func1)
plot(result)

result2 <- sapply(rep(500, 1000), func1)
mean( abs(result2 -2) >= 0.01)
result3 <- sapply(rep(50000, 1000), func1)
mean(abs(result3 - 2) >= 0.01)

x1 <- rnorm(1000, 1, sqrt(3)) #N(1,3)を1000個
x2 <- rnorm(1000, 3, sqrt(5)) #N(3,5)を1000個
#両者を足したものが，N(4,8)とみなせるか？
hist(x1+x2, freq=F, main="", ylim=c(0, 0.15))
curve(dnorm(x, 4, sqrt(8)), col=2, add=T)

func1 <- function(n) mean(rpois(n, 2))
result2 <- sapply(rep(500, 1000), func1)
hist((result2 - 2)/sqrt(2/500))
curve(dnorm(x, 0, 1), col=2, add=T)
