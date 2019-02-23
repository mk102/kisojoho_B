#練習問題
#(1)
max(iris$Sepal.Width)
min(iris$Sepal.Width)
#(2)
osa <- cut(iris$Sepal.Width, breaks = seq(2,4.5,by=0.5),
    right=T)
head(osa, 15)
#(3)
table(osa)
#(4)
table(osa, iris$Species)
addmargins(table(osa, iris$Species))

#古典的確率
factorial(6) #6!
choose(7, 3) #7C3

permut <- function(n ,k) factorial(n)/factorial(n-k)
permut(7, 3) #7P3

#練習問題
#(1)
choose(70, 5)/choose(100, 5)
#(2)
permut(30, 2)*factorial(48)/factorial(50)

#経験的確率
#無作為抽出
#sample(ベクトル，n)
sample(1:10, 7) #1から10より7個を非復元抽出
sample(1:10, 7, replace=T) #復元抽出
#コインを10回投げてみる
sample(c("H","T"), 10, replace=T)
table(sample(c("H", "T"), 100, replace=T))
table(sample(c("H", "T"), 1000, replace=T))
table(sample(c("H", "T"), 100000, replace=T))
#数値実験の再現
#set.seed(n) で乱数の種（初期値）を設定
set.seed(100) #初期化
sample(c("H", "T"), 10, replace=T)
set.seed(100)
sample(c("H", "T"), 10, replace=T)

#練習問題
#(1)
set.seed(601)
sample(1:55, 8)
#(2)
set.seed(601)
table(sample(1:6, 10000, replace=T))/10000

#確率変数と確率分布
#一様分布
dunif(2, 0, 3) #これは密度の値f(2)=1/3
punif(2, 0, 3) #p(X<=2)

#例題
#(1)
punif(7, 0, 10)
#(2)
1 - punif(6, 0, 10)
punif(6, 0, 10, lower.tail=F) #こちらでもよい
#(3)
qunif(0.5, 0, 10)

#密度関数のグラフを描画
curve(dunif(x, 1, 3), xlim=c(0,4), ylim=c(0,1))
xvals <- seq( 2, 2.5, length=10) #xの範囲で点を
dvals <- c(0, dunif(xvals, 1, 3), 0) #密度の値を
polygon(c(2, xvals, 2.5), dvals, col=4, density=10)

#一応乱数の生成
x <- runif(1000) #一応乱数1000個
hist(x) #ヒストグラム描画

pnorm(-1.645) #P(X<=-1.645)
qnorm(0.025, lower.tail=F)
pnorm( 7, m=1, sd=3)
pnorm( 6, m=4, sd=sqrt(2), lower.tail=F)
qnorm(0.1)
qnorm(0.05, -2, sqrt(7), lower.tail=F)

#密度関数を描画
curve( dnorm(x), xlim=c(-3,3))
xvals <- seq(0, 1.5, length=10)
dvals <- c(0, dnorm(xvals), 0)
polygon( c(0, xvals, 1.5), dvals, col=3, dendity=-1)
#正規乱数の生成
y <- rnorm(1000)
hist(y)

