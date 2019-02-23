osarai <- read.csv("osarai0427.csv") # データ読み込み
head(osarai,4)

table(osarai$grade) # 成績の集計

head(iris,5) # 先頭から5行だけ表示

#問題
#(1)
mean(iris$Sepal.Length)
#(2)
mean( iris[1:50,]$Sepal.Length) # setosa
mean(iris[51:100,]$Sepal.Length) # versicolor
mean(iris[101:150,]$Sepal.Length) # virginica

iris[1:50,]
iris[51:100,]
iris[101:150,]

# typeofでデータ型を確認
typeof(1) # 単に数を入力しただけ
typeof(1L) # Lをつけると
typeof("1") # 二重引用符で挟むと
typeof(TRUE) # TRUEはT，FALSEはFで省略可
# テスト関数is.型名で型を検査することも可能

#ベクトルの構成要素は全て同じ型でなければならない
(a1 <- c(TRUE, FALSE, F, T)); typeof(a1) #論理型
(a2 <- c("a", "b", "cd", "1")); typeof(a2) #文字型
#異なる型を含むベクトルを作ろうとすると勝手に統一される
(a3 <- c(TRUE, 1, "a")); typeof(a3) #文字型になる
#統一する基準は，文字型＞実数型＞整数型＞論理型

#欠損値NA（データの欠測を表す）
(a4 <- c(1,2,3,NA,5)) #4番目欠測
typeof(a4) #データ型は？
mean(a4) #NAを含むと計算できないことも
#無限大Inf,-Inf 1/0を実行すると
#NaN，0/0を実行すると
c(-1,0,1)/0

#属性
#関数namesでベクトルに名前属性を付加
score <- c(90, 50, 60)
subject <- c("Eng", "Math", "Sci")
names(score) <- subject
score
#名前付きベクトルは要素の名前でデータにアクセスできる
score["Math"]

#時系列属性
#関数tsを用いて時系列属性を付加
#ts(ベクトル，start=xxxx, frequency=zz)
hikone <- c(3.9, 4.8, 7.9, 13.6, 19.3, 21.6, 26.2,
            27.4, 22.1, 17.2, 13.4, 8.6)
hikone2 <- ts(hikone, start = c(2015, 1), frequency = 12)
hikone2

#因子ベクトル
#関数facrorを用いると名義尺度データにカテゴリー水準の属性を付加
blood <- factor(c("A", "O", "B", "A", "AB"))
blood
typeof(blood)

#リスト
#関数listで作成　要素としてベクトル，行列，リスト自身もOK
b1 <- list(TRUE, 1, "a", c(1L,2L), list(1:3,TRUE))
str(b1) #関数strで内部構造をみてみると

#行列 ベクトルに次元を付加してできたもの
c1 <- matrix(1:20, nrow=4, ncol=5)
rownames(c1) <- c("相田", "上田", "岡田", "菊田")
colnames(c1) <- c("Eng", "Math", "Phys", "Chem", "Bio")
c1
attributes(c1) #行列の属性を見る

head(iris, 5)
head(iris$Species)

#データフレームの作成
d1 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
d2 <- c(50, 75, 30, 70, 90)
d3 <- c("C", "B", "E", "C", "A")
(x <- data.frame(report=d1, exam=d2, grade=d3))

#グラフの作図
#関数plot
#plot(xxx)はxxxに何を与えるかで出力結果は異なる
#数値ベクトルx　横軸は1，2，．縦軸はxの要素の値の点を描画(時系列なら折れ線)
plot(hikone)
plot(hikone2)
plot(x$grade)

plot(cars$speed, cars$dist) #plot(cars)も同様
plot((0:24)*pi/6, sin((0:24)*pi/6))
plot(sleep$group, sleep$extra)
plot(iris)

#ヒストグラムには関数histを用いる
x <- rnorm(100) #正規乱数100個発生
hist(x) # ヒストグラム
hist(x, breaks=-3:3)

boxplot(iris$Sepal.Length) #箱ひげ図
boxplot(Sepal.Length~Species,data=iris)　# 種ごとに

