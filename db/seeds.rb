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
  name: "Ryo Kitatani",
  email: "test1@gmail.com",
  password: 123456,
  introduction: "千葉県出身の大学2年生です！留学目指してます！",
  living_country: "日本",
  experienced_country: "US",
  is_deleted: "false"
)

Member.create!(
  name: "Mikitaka Fukane",
  email: "test2@gmail.com",
  password: 123456,
  introduction: "北海道出身のみきたかです。留学目指して勉強中です。",
  living_country: "日本",
  experienced_country: "China",
  is_deleted: "false"
)

Member.create!(
  name: "Mizuki Kamezaki",
  email: "test3@gmail.com",
  password: 123456,
  introduction: "こんにちは",
  living_country: "日本",
  experienced_country: "Korea",
  is_deleted: "false"
)

Member.create!(
  name: "Kazuki Nozaki",
  email: "test4@gmail.com",
  password: 123456,
  introduction: "",
  living_country: "",
  experienced_country: "",
  is_deleted: "false"
)

Member.create!(
  name: "Taichirou Inada",
  email: "test5@gmail.com",
  password: 123456,
  introduction: "",
  living_country: "",
  experienced_country: "",
  is_deleted: "false"
)

Tag.create!(name: "留学")
Tag.create!(name: "語学")
Tag.create!(name: "英語")
Tag.create!(name: "短期留学")
Tag.create!(name: "交換留学")
Tag.create!(name: "専門留学")
Tag.create!(name: "イギリス")
Tag.create!(name: "アメリカ")
Tag.create!(name: "カナダ")
Tag.create!(name: "社会人")
Tag.create!(name: "大学生")
Tag.create!(name: "高校生")
Tag.create!(name: "中高生")
Tag.create!(name: "費用")
Tag.create!(name: "奨学金")
Tag.create!(name: "ビザ")
Tag.create!(name: "新型コロナウイルス")

5.times do |n|
  Question.create!(
    member_id: 1 + n,
    title: "留学に関して#{n+1}",
    content: "質問内容の記述テストです#{n+1}",
  )
end

5.times do |n|
  Question.create!(
    member_id: 1 + n,
    title: "英語の勉強法について#{n+1}",
    content: "単語帳、NETFLIX#{n+1}",
  )
end


Answer.create!(
  question_id: 1,
  member_id: 2,
  content: "解決策を記入する。",
)

Answer.create!(
  question_id: 2,
  member_id: 3,
  content: "解決策を記入する。",
)

Answer.create!(
  question_id: 3,
  member_id: 4,
  content: "解決策を記入する。",
)

Answer.create!(
  question_id: 4,
  member_id: 1,
  content: "解決策を記入する。",
)

4.times do |n|
  Response.create!(
    answer_id:1 + n,
    member_id:1 + n,
    content:"ありがとうございます！"
  )
end

4.times do |n|
  QuestionTag.create!(
    question_id:1 + n,
    tag_id:1 + n
  )
end

4.times do |n|
  QuestionTag.create!(
    question_id:5 + n,
    tag_id:5 + n
  )
end
