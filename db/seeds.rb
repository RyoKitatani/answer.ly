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
  introduction: "千葉県出身の大学2年生です！留学目指してます！",
  experienced_country: "US",
  is_deleted: "false"
)

Member.create!(
  name: "MikitakaFukane",
  email: "test2@gmail.com",
  password: 123456,
  introduction: "北海道出身のみきたかです。留学目指して勉強中です。",
  experienced_country: "China",
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
  introduction: "こんにちは",
  experienced_country: "",
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
  {name: "時間がない"},
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
  {name: "ワーキングホリデー"}
])

Question.create!(
  member_id: 1,
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

  みなさんが学生の立場だとしたらどの国を選びますか？",
)


Answer.create!(
  question_id: 1,
  member_id: 2,
  content:
  "オーストラリア・ニュージーランドへの入国はかなり難しいと思います。
  ほぼ国境封鎖状態です。
  アメリカは治安が悪化していますし、行くとしたらカナダではないでしょうか。
  ただしどこも大学の立地によります。",
)

Response.create!(
  answer_id:1,
  member_id:1,
  content:"ありがとうございます！"
)
