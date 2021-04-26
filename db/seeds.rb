# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASS']
)

Member.create!(
  name: "RyoKitatani",
  email: "test1@gmail.com",
  password: 123456,
  introduction: "大学2年生です！留学目指してます！",
  experienced_country: "アメリカ",
  is_deleted: "false"
)

Member.create!(
  name: "MikitakaFukane",
  email: "test2@gmail.com",
  password: 123456,
  introduction: "大学生ののみきたかです。留学目指して勉強中しています。",
  experienced_country: "経験なし",
  is_deleted: "false"
)

Member.create!(
  name: "MizukiKamezaki",
  email: "test3@gmail.com",
  password: 123456,
  introduction: "こんにちは",
  experienced_country: "Korea",
  is_deleted: "false"
)

Member.create!(
  name: "KazukiNozaki",
  email: "test4@gmail.com",
  password: 123456,
  introduction: "野崎です。よろしくお願いします。",
  experienced_country: "中国",
  is_deleted: "false"
)

Member.create!(
  name: "TaichirouInada",
  email: "test5@gmail.com",
  password: 123456,
  introduction: "こんにちは",
  experienced_country: "",
  is_deleted: "false"
)

Tag.create!([
  {name: "留学"},
  {name: "短期留学"},
  {name: "交換留学"},
  {name: "専門留学"},
  {name: "イギリス"},
  {name: "アメリカ"},
  {name: "カナダ"},
  {name: "ヨーロッパ"},
  {name: "オーストラリア"},
  {name: "オランダ"},
  {name: "ニュージーランド"},
  {name: "マレーシア"},
  {name: "フィリピン"},
  {name: "中国"},
  {name: "韓国"},
  {name: "台湾"},
  {name: "社会人"},
  {name: "大学生"},
  {name: "高校生"},
  {name: "中高生"},
  {name: "学生"},
  {name: "学習"},
  {name: "学習方法"},
  {name: "英語学習"},
  {name: "留学準備"},
  {name: "アルバイト"},
  {name: "食生活"},
  {name: "食事"},
  {name: "費用"},
  {name: "奨学金"},
  {name: "ビザ"},
  {name: "新型コロナウイルス"},
  {name: "ワーキングホリデー"},
  {name: "TOEIC"},
  {name: "TOFLE"},
  {name: "IELTS"},
  {name: "英検"}
])

Question.create!([
 {member_id: 1,
  title: "留学先の国に関して迷っています。",
  content:
   "私の通っている学科では１年間の留学があるのですが、
   どの国を希望するか決めかねています。
   誰にもこの後のことはわからないとは思いますが、判断の参考にさせていただきたいのでコメントをお願いします。

   まず大学の方針として、
   イギリス・アメリカ・カナダは現時点で学生ビザの取得は可能なので、外務省が出している感染症危険レベルが2に下がれば渡航可能です。
   オーストラリア・ニュージーランドは危険レベルが2なのですが、学生ビザの新規発行が停止されているのでビザが発行再開され取得でき次第渡航可能です。
   渡航できなければオンラインで現地大学の授業をとり、渡航出来次第現地へ渡ることになります。留学開始は留学先大学により異なりますが、
   今年の7月末〜9月中旬ごろです。5月末までにはどこの大学に留学するのか正式に決めなければなりません。

   みなさんが学生の立場だとしたらどの国を選びますか？"},

 {member_id:2,
  title: "短大から海外大学へ進学したい",
  content:
   "英語特化の短大から2年から海外の大学2年といったルートを進みたいのですがおすすめ大学や国などありますか？"
  },

 {member_id:3,
  title: "海外での大学進学を考えています。",
  content:
   "私は私立の高校に通った後にバイトのできないビザで半年､親の援助を借りながら1年外国に滞在しました。
    日本の大学に通うことを視野に入れて準備されていた私の貯金をこのように使いました。
    私立の学費が高い高校に通わせてもらった事､私のワガママのために大金を使ってもらった事､大学進学は20歳を過ぎてからの決断という事で
    親に頼るのはやめて､留学ローンを組んで自分で返済する事を前提に行こうと思っております。
    貯めてから行けばいいと言う意見も親族から聞きましたが､年齢的にも私なりの人生計画があるので来年の春から通えなければもう無理だと考えて留学ローンという答えが出ました。
    私が行こうと思っている大学は外国人を積極的に受け入れており､TOEICのような資格を大学側が指定している級まで持っていれば学費免除などがあります。
    そしてその国では学費が安い事で有名です。
    安いなりにレベルが高かったり判定が厳しかったりしますがその覚悟は充分にあります。
    資格を取ったり良い成績を取ったり､学費を免除するために自分で出来ることはするつもりですが
    それでも賄えない学費や生活費などはローンを組んでいこうとおもいます。

    前置きが長くなりましたが､いくら調べても留学ローンについて詳しい記事が出てきません。
    もしご存知の方がいらっしゃいましたら､教えていただけないでしょうか。
    (私はコロナだからと夢を諦めるのは間違ってると思いますし､年齢も関係ないと思います。このご時世に留学なんて､20歳を過ぎてから大学進学なんて､などの意見は不要です。)"
  },

 {member_id:4,
  title: "短大から海外大学へ進学したい",
  content:
   "英語特化の短大から2年から海外の大学2年といったルートを進みたいのですがおすすめ大学や国などありますか？"
  },

])

QuestionTag.create!([
 {question_id:1,
  tag_id: 1,
 },
 {question_id:1,
  tag_id: 32,
 },
 {question_id:1,
  tag_id: 18,
 },
 {question_id:2,
  tag_id: 1,
 },
 {question_id:2,
  tag_id: 3,
 },
 {question_id:3,
  tag_id: 29,
 },
])

Answer.create!([
 {question_id: 1,
  member_id: 2,
  content:
  "オーストラリア・ニュージーランドへの入国はかなり難しいと思います。
  ほぼ国境封鎖状態です。
  アメリカは治安が悪化していますし、行くとしたらカナダではないでしょうか。
  ただしどこも大学の立地によります。",
 },
 
 {question_id: 2,
  member_id: 3,
  content:
  "貴方が通っている短大に提携している海外の大学を聞いてください。
   提携していないと2年間で習得した教科・単位が認められないことがありますので。"
 },
 
 {question_id: 3,
  member_id: 4,
  content:
  "政府系と民間系があります。
   ◆政府系
   日本政策金融公庫
   ◆主な民間系
   みずほ銀行、三菱東京UFJ銀行、神奈川銀行、労働金庫
   300万円～1,000万円くらいになります。
   但し、未就労の貴方は借りれませんので親が借りることになります。"
 },
])



Response.create!(
  answer_id:1,
  member_id:1,
  content:"ありがとうございます！"
)
