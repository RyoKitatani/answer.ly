# Answer.ly(アンサリー)　

### トップ画面
<img width="1425" alt="スクリーンショット 2021-04-25 18 08 42" src="https://user-images.githubusercontent.com/77328172/115987746-4a77d200-a5f1-11eb-925b-edfbd96b8d00.png">

## サイト概要 
留学したい人や気になっている人など、留学に関連する方が気軽に質問・回答が得られるQ&Aです。

### サイトテーマ

留学に関する不安を質問したら、求めている回答が、**``いつもで気軽に``** 得られるサイト。<br>
英語にしてつなぎ合わせたのが、Answer.ly(answer × freely)

### テーマを選んだ理由

私は、大学3年次にアメリカへ1年間の交換留学をしましたが、初めての海外生活で知らないことばかり。とても不安でした。<br>
以下は私が当時感じていた事です。

* 初めての海外生活であったため、知らないことばかりでとても不安だった。
* 留学に関する不安を質問したくでも、大学の学生課と過去に留学した先輩学生のみ。(繋がりがあれば)
* 留学中の英語の勉強方法(スピーキングなど)など、本当にこれでいいのか？と不安があった。

**``同じような不安を持つ人達を支援したい、不安を取り除きより良い留学生活にしてほしいと思い、今回のテーマを選定しました。``**

### ターゲットユーザー

* これから留学したい方(大学から社会人まで)
* 留学することが不安、留学しようか迷っている方
* 留学経験のある方

### 主な利用シーン

* 留学の為に勉強方法がわからない時。
* 留学するまでの準備期間で気になることがある時。　などなど

# 実装機能一覧

|  | 機能 | gem / 備考  |
|:---:|:---|:---|
| 1 |ユーザー/管理者(ログイン機能) |devise |
| 2 |ゲストログイン機能| × |
| 3 |SNSログイン機能| devise/omniauth(google/facebook/twitter)|
| 4 |マイページ機能 | refile/ refile-mini_magick |
| 5 |質問投稿 | summernote-rails(テキストエディター)|
| 6 |回答機能| summernote-rails(テキストエディター)|
| 7 |コメント機能|Ajax(非同期)|
| 8 |検索機能 | × / 部分一致(質問/タグ/ユーザーが検索可能)|
| 9 |通知機能 | × |
| 10 |フォロー機能 | Ajax(非同期)|
| 11 |いいね機能 | Ajax(非同期)|
| 12 |ベストアンサー機能|×|
| 13 |DM機能 | Ajax(非同期)|
| 14 |タグ機能| × |
| 15 |ランキング機能|×|
| 16 |PV機能 | impressionist|
| 17 |SNSシェア機能 | social-share-button|
| 18 |お問い合わせ機能| Action Mailer|
| 19 |ページネーション機能|kaminari|
| 20 |rails/devise日本語化|rails-i18n||
| 21 |レスポンシブ対応| Bootstrap |
| 22 |コード解析 | RuboCop|
| 23 |単体・結合テスト(一部) |RSpec|
| 24 |自動デプロイ | AWS, Github Actions(CI/CDツール)
| 25 |https設定 |Certbot |
| 26 |ドメイン指定 |お名前.com / AWSRoute 53|

# 設計書

### ER図
![answer ly-ER図](https://user-images.githubusercontent.com/77328172/116401217-f3c6fe00-a865-11eb-8ba6-51286049d483.jpg)
https://app.diagrams.net/#G1O3LIzvRVAKC4oh24vnrjDWSEBYX4IxbE

### ワイヤーフレーム & UI Flows
https://app.diagrams.net/#G1O3LIzvRVAKC4oh24vnrjDWSEBYX4IxbE

### テーブル定義書　

https://docs.google.com/spreadsheets/d/1SRMZV79FV04XzANJEO0nNvsQlUh2f4tNyPNthv0bH0A/edit?usp=sharing

## 開発環境

* OS：Linux(CentOS)
* 言語：HTML,CSS,JavaScript,Ruby,SQL
* フレームワーク：Ruby on Rails
* JSライブラリ：jQuery
* IDE：Cloud9

# 使用方法

```
$ git clone git@github.com:RyoKitatani/answer.ly.git
$ bundle install --without production
$ rails db:migrate
$ rails db:seed
$ rails s
```

**管理者用**<br>
メールアドレス:admin@admmin.com<br>
パスワード:123456<br>
管理者用ログインURL: /admin/sign_in
もしくは、URLにadminと打ち込む。

**一般ユーザー**<br>
新規会員登録、もしくはゲストログインをご利用ください。


