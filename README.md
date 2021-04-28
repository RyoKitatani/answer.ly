# Answer.ly(アンサリー)

<img width="1425" alt="スクリーンショット 2021-04-25 18 08 42" src="https://user-images.githubusercontent.com/77328172/115987746-4a77d200-a5f1-11eb-925b-edfbd96b8d00.png">


## サイト概要 
留学したい人や気になっている人など、
留学に関連する方が気軽に質問・回答が得られるQ&Aです。

### サイトテーマ

留学に関する不安を質問したら、<br>
求めている回答が、気軽に得られるサイト。<br>
英語にしてつなぎ合わせたのが、Answer.ly(answer × freely)

### テーマを選んだ理由

私は、大学3年次にアメリカへ1年間の交換留学をしました。<br>
その留学を振り返った際に下記の不安があったことから、<br>
**同じ不安をもった人たちを支援したいと思い今回のテーマを選定しました。**

* 初めての海外生活であったため、知らないことばかりでとても不安だった。
* 留学に関する不安を質問したくでも、大学の学生課と過去に留学した先輩学生のみ。(繋がりがあれば)
* 留学中の英語の勉強方法(スピーキングなど)など、本当にこれでいいのか？と不安があった。
* もっと情報収集が出来れば、充実した留学ライフを過ごせるのではと思った。

### ターゲットユーザー

* これから留学したい方(大学から20代社会人まで)
* 留学することが不安、留学しようか迷っている方
* 留学経験のある方

### 主な利用シーン

留学に関して疑問・不安がある時に利用します。

具体例として、
* 留学の為に勉強方法がわからない時。
* 留学するまでの準備期間で気になることがある時。
* 留学経験者と繋がりたい時に。

そんな時に利用するサイトです。

# 使用方法

```
$ git clone git@github.com:RyoKitatani/answer.ly.git
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails s
```

## 設計書

### ER図
![answer ly-ER図](https://user-images.githubusercontent.com/77328172/116401217-f3c6fe00-a865-11eb-8ba6-51286049d483.jpg)

### ワイヤーフレーム & UI Flows
https://app.diagrams.net/#G1O3LIzvRVAKC4oh24vnrjDWSEBYX4IxbE

### テーブル定義書　

https://docs.google.com/spreadsheets/d/1SRMZV79FV04XzANJEO0nNvsQlUh2f4tNyPNthv0bH0A/edit?usp=sharing

### チャレンジ要素一覧

https://docs.google.com/spreadsheets/d/1GKJ7aZMcrRR2YwcuRfL-F2DGFRE_w-ZEhYM93c7TlAY/edit#gid=0

## 開発環境

* OS：Linux(CentOS)
* 言語：HTML,CSS,JavaScript,Ruby,SQL
* フレームワーク：Ruby on Rails
* JSライブラリ：jQuery
* IDE：Cloud9


