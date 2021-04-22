require 'rails_helper'

RSpec.describe Member, type: :model do
  
  describe "データの保存" do
    it "有効なデータの保存"do
      expect(FactoryBot.build(:member)).to be_valid
    end
    
    context "空白のバリデーショント" do
      it "名前が空欄" do
        member = Member.new(name:"", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_invalid
      end
      
      it "メールアドレスが空白" do
        member = Member.new(name:"testuser", email:"", password:"password", password_confirmation:"password")
        expect(member).to be_invalid
      end
      
      it "パスワードが空白" do
        member = Member.new(name:"testuser", email:Faker::Internet.email, password:"", password_confirmation:"password")
        expect(member).to be_invalid
      end
      
      it "パスワードの確認が空白" do
        member = Member.new(name:"testuser", email:Faker::Internet.email, password:"password", password_confirmation:"")
        expect(member).to be_invalid
      end
    end
    
    context "データの一致" do
      it "パスワードの一致" do
        member = Member.new(name:Faker::Lorem.characters(number:12), email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_valid
      end
      
      it "パスワードの不一致" do
        member = Member.new(name:Faker::Lorem.characters(number:12), email:Faker::Internet.email, password:"password", password_confirmation:"passward")
        expect(member).to be_invalid
      end
      
      it "同じユーザー名での保存不可" do
        member1 = Member.new(name:"testuser", email:Faker::Internet.email, password:"password", password_confirmation:"passward")
        member2 = Member.new(name:"testuser", email:Faker::Internet.email, password:"password", password_confirmation:"passward")
        expect(member2).to be_invalid
      end
    end
    
    context "名前の文字数のチェック" do
      it "名前の文字数が3文字以内" do
        member = Member.new(name:"ab", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_invalid
      end
      
      it "名前の文字数が20文字以内" do
        member = Member.new(name:"abcdefghijklmnopqrst", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_valid
      end
      
      it "名前の文字数が20文字以上" do
        member = Member.new(name:"abcdefghijklmnopqrstu", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_invalid
      end
    end
    
    context "名前の文字制限のチェック" do
      it "全半角英数字のみ入力" do
        member = Member.new(name:"Abde123", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_valid
      end
      
      it "全角英字のみ入力" do
        member = Member.new(name:"ABCDEF", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_valid
      end
      
      it "半角英字のみ入力" do
        member = Member.new(name:"abcdef", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_valid
      end
      
      it "数字のみ入力" do
        member = Member.new(name:"123456", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_valid
      end
      
      it "空欄の入力不可(半角)" do
        member = Member.new(name:"Abde 123", email:Faker::Internet.email, password:"password", password_confirmation:"password")
        expect(member).to be_invalid
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:questions).macro).to eq :has_many
      end
    end
    
    context 'question_likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:question_likes).macro).to eq :has_many
      end
    end
    
    context 'answersモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:answers).macro).to eq :has_many
      end
    end
    
    context 'answer_likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:answer_likes).macro).to eq :has_many
      end
    end
    
    context 'responseモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:responses).macro).to eq :has_many
      end
    end
    
    context 'questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(Member.reflect_on_association(:questions).macro).to eq :has_many
      end
    end
  end 
  
end
