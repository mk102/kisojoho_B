# 問題
#(1)
plot(iris$Sepal.Length, iris$Sepal.Width)
#(2)
osarai1 <- read.csv("osarai0427.csv")
boxplot(score~gender, data=osarai1)
#(3)
osarai2 <- read.csv("osarai0511.csv")
Hikone <- ts(osarai2$Hikone, start=1900)
plot(Hikone)

# main:タイトル指定　xlab,ylab:軸ラベル指定
plot(Sepal.Width~Sepal.Length, data=iris,
     main="がく辺の長さと幅", xlab="長さ", ylab="幅")

# xlim,ylim:軸の範囲指定
plot(Sepal.Width~Sepal.Length, data=iris,
     xlim=c(4,8), ylim=c(0,5))

# col:色指定 pch:点の種類指定
plot(Sepal.Width~Sepal.Length, data=iris,
     col="red", pch=2)

# 因子ごとに区別
# col または pch=as.integer(因子列)
plot(Sepal.Width~Sepal.Length, data=iris,
     col=as.integer(Species))

# 凡例を追加
# legend(x,y,labels,col=???, pch=???)
plot(Sepal.Width~Sepal.Length, data=iris,
     col=as.integer(Species), pch=as.integer(Species))
legend(6, 4, c("setosa", "versicolor", "virginica"),
       col=1:3, pch=1:3)

# 折れ線グラフの描画(時系列属性を付与していないベクトルの場合)
# plot(x,y, type="l")
plot(1900:2017, osarai2$Tokyo, type="l")

# 折れ線グラフの軽形式や太さ
# lty, lwd
plot(Hikone, lty="dashed") # lty=2でも同じ

#練習問題
#(1)
plot(Petal.Width~Petal.Length, data=iris,
     main="花弁の長さと幅", xlab="長さ", ylab="幅",
     col=as.integer(Species), pch=as.integer(Species))
legend(1, 2.2, c("setosa", "versicolor", "virginica"),
       col=1:3, pch=1:3)
#(2)
plot(1900:2020, osarai2$Tokyo, type="l",
     main="東京の年平均気温", xlab="年", ylab="気温",
     col="blue", ylim=c(12,18))

hist(sleep$extra, col="blue", main="色付きのヒストグラム")

boxplot(extra~group, data=sleep, col=2, horizontal=T)

# 1次元の散布図
stripchart(extra~group, data=sleep, ylim=c(.8,2.2))

# 数学関数を描画
curve(sin, 0, 2*pi) # sinのグラフ
curve(cos, 0, 2*pi, lty=3, col=2, add=T) # cos追加

# 描画領域のパラメータ設定
# mar = c(a, b, c, d)　描画領域の余白を指定
# mfrow=c(N,M) N*Mに描画領域を分割
par( mfrow=c(1, 3) ) # 1*3に分割
plot(1:10); plot( Hikone ); plot(cars)
# parで指定するとウィンドウを閉じるまで設定は有効


