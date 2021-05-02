require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "データの保存" do
    subject { tag.valid? }

    let(:tag) { create(:tag) }

    it "有効なデータの保存" do
      expect(FactoryBot.build(:tag)).to be_valid
    end

    context "空白のバリデーション" do
      it "タグ名が空欄" do
        tag.name = ""
        is_expected.to eq false
      end
    end

    context "文字数のチェック" do
      it "タグ名が文字数が15文字以下は登録可能" do
        tag.name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end

      it "タグ名が文字数が16文字以上は登録不可" do
        tag.name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'question_tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:question_tags).macro).to eq :has_many
      end
    end
  end
end
