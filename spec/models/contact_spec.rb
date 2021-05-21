require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "データの保存" do
    subject { contact.valid? }

    let(:contact) { build(:contact) }

    it "有効なデータの保存" do
      expect(FactoryBot.build(:contact)).to be_valid
    end

    context "空白のバリデーション" do
      it "名前が空欄" do
        contact.name = ""
        is_expected.to eq false
      end

      it "メールアドレスが空白" do
        contact.email = ""
        is_expected.to eq false
      end

      it "タイトルが空白" do
        contact.title = ""
        is_expected.to eq false
      end

      it "お問い合わせ内容が空白" do
        contact.message = ""
        is_expected.to eq false
      end
    end

    context "文字数チェック" do
      it "名前の文字数が20文字以下" do
        contact.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end

      it "名前の文字数が21文字以内" do
        contact.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end

      it "タイトルの文字数が50文字以下" do
        contact.title = Faker::Lorem.characters(number: 50)
        is_expected.to eq true
      end

      it "タイトルの文字数が51文字以上" do
        contact.title = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end

      it "お問い合わせ内容の文字数が500文字以下" do
        contact.message = Faker::Lorem.characters(number: 500)
        is_expected.to eq true
      end

      it "お問い合わせ内容の文字数が501文字以上" do
        contact.message = Faker::Lorem.characters(number: 501)
        is_expected.to eq false
      end
    end
  end
end
