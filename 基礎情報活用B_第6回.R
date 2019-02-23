#練習問題
#(1)
less.3 <- subset(iris, Sepal.Width<3)
head(less.3)
#(2)
apply(less.3[,1:4], 2, mean)
#(3)
boxplot(Sepal.Length~Species, data=less.3)
#(4)
by(less.3, less.3$Species, summary)

#関数を作る
#関数名 <- function(引数1，引数2，・・・){関数の中身}
sq.sum <- function(x) sum(x^2) #二乗和を求める
sq.sum(1:5)

#例題
variance <- function(x){
  m <- mean(x)
  N <- length(x)
  sum((x-m)^2)/N #最後の計算を出力
}
variance(1:5); var(1:5)
#apply等でも関数として利用できる
apply(iris[,1:4], 2, variance)

#質的データの要約
#頻度集計 table(因子ベクトル)
table(iris$Species)
table(less.3$Species)
#関数xtabsでも同様
#xtabs(~因子列名，data=データ名，条件式)
xtabs(~Species, data=iris)
#種ごとにがく辺の幅が3以上のものを集計
xtabs(~Species, data=iris, Sepal.Width >= 3)

#集計データの視覚化
barplot(table(less.3$Species))
pie(table(less.3$Species), clockwise=T)

#練習問題
#(1)
x <- read.csv("data0525.csv")
table(x$Report)
xtabs(~Report, data=x)
#(2)
xtabs(~Grade, data=x)
barplot(table(x$Grade))
#(3)
xtabs(~Grade, data=x, Report==TRUE)
#(4)
xtabs(~Grade, data=x, Score < 60)

#度数分布表
y <- read.csv("data0518.csv") #データ読み込み
kukan <- (0:10)*10　#幅10の区間を用意
y$Math
cut(y$Math, breaks=kukan,  #yのMath列をグループ化
    right=F, include.lowest=T)　#端点の処理
M.freq <- table(cut(y$Math, breaks=kukan,
                    right=F, include.lowest=T))
M.freq
N <- length(y$Math)
rel.freq <- M.freq/N #相対度数
cum.freq <- cumsum(M.freq)　#累積度数
cum.rel <- cum.freq/N　#累積相対度数
cbind(M.freq, rel.freq, cum.freq, cum.rel)

#csvファイルへの出力
#write.csv(変数名，file="ファイル名.csv")
M.tab <- cbind(M.freq, rel.freq, cum.freq, cum.rel)
write.csv(M.tab, file="M.table.csv")

#2変量データの要約
cov(cars$speed, cars$dist) #共分散
cor(cars$speed, cars$dist) #相関係数
cor(iris$Sepal.Length, iris$Sepal.Width)

#分散共分散行列
#データフレームを与える
cov(iris[,1:3])
cor(iris[,1:3])

#因子ごとに相関係数を計算
by(iris[,1:2], iris$Species, cor)

#回帰直線を求める
#lm(y列名~x列名,data=***)
lm(dist~speed, data=cars)

#2変量の質的データの集約
#table(因子データ1，因子データ2)
(z <- table(x$Gender, x$Grade)) #男女別に成績集計
#関数addmarginsで周辺和を追加できる
addmargins(z)
#xtabsでも可能
zz <- xtabs(~Gender + Grade, data=x)
addmargins(zz)

#練習問題
#(1)
iris.set <- subset(iris, Species=="setosa")
cov(iris.set$Sepal.Length, iris.set$Sepal.Width)
cor(iris.set$Sepal.Length, iris.set$Sepal.Width)
#(2)
lm(Sepal.Width~Sepal.Length, data=iris.set)
#(3)
xtabs(~Gender+Report, data=x)
#(4)
xtabs(~Report+Grade+Gender, data=x)
#(5)
plot(dist~speed, data=cars)
abline(lm(dist~speed,data=cars))

