#前回のおさらい
head(cars)
plot(cars$speed,cars$dist)
plot(dist~speed, data=cars, col="red",
     main="osarai")

#列データの抽出
getwd()
setwd("/Users/mikio/Desktop/大学/4年/卒業論文/データ")
x <- read.csv('data0518')
head(x)
x$Eng
x[, 2]

#複数列を同時に抽出
x[, c("Eng", "Phys")]
plot(x[,c(2,4)])

#行データの抽出
x[2,]
x[1:5,]

#複数行を同時に抽出
x[c(2,4),]

#行と列を取り出す
x[c(1,3,5),2]

#条件を満たす行のデータを抽出
#subset(データ名，条件式，select=***)
  #条件式で行の条件を指定
  #select=で列名を指定
subset(x, Phys>=70) #物理70点以上を抽出
subset(x, Phys>=70 & Math<=60) #物理70点以上かつ数学60点以下
subset(x, Gender=="F" & Eng<=60) #女性で60点以下
subset(x, Eng<60, select=c(Eng,Math)) #英語60未満の英数

#練習問題
#(1)
subset(x, Eng>=60)
#(2)
subset(x, Math>=70 | Phys >=70)
#(3)
subset(x, Phys == max(x$Phys))
#(4)
mean(subset(x, Gender=="F")$Eng)
mean(subset(x, Gender=="M")$Eng)

#列データの結合
#列データの結合は，関数cbind
x.chemi <- read.csv("data_col.csv")
head(cbind(x,x.chem), 4) #5列目に化学を追加
head(data.frame(x, x.chem), 4) #data.frameでも同様な動作が可

#行データの結合
#行データの結合は，関数rbind
x_plus4 <- read.csv("data_row.csv")
head(rbind(x, x_plus4), 4)

#代表値の計算
#平均値 関数mean
mean(x$Eng)
#中央値　関数median
median(x$Eng)
#四分位数　関数quantile
quantile(x$Eng)
#最大値max, 最小値minなど

#分散（標本分散）関数var
var(x$Eng)
#標準偏差　関数sd
sd(x$Eng)
#四分位範囲　関数IQR
IQR(x$Eng)
#範囲　関数range を利用

#練習問題
mean(x)
var(x)
mean(subset(x, Gender=="F"))
var(subset(x, Gender=="F"))
mean(subset(x, Gender=="M"))
var(subset(x, Gender=="M"))

#代表値を計算するための技法
#apply(データ名，1（行に）or2（列に），関数)
apply(x[,2:4], 1, mean) #各個人の平均点
apply(x[,2:4], 2, mean) #各科目の平均点

#因子別に分けて代表値を計算
#tapply(ベクトル，因子ベクトル，関数)
tapply(x$Eng, x$Gender, mean) #英語の男女別平均点
tapply(x$Math, x$Gender, sd) #数学の男女別標準偏差

#因子別に分けて代表値を計算2
#by(データフレーム ，因子列，関数)
by(x[, 2:4], x$Gender, summary) #関数meanではエラーが


