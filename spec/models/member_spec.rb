require 'rails_helper'

RSpec.describe Member, type: :model do

  describe "データの保存" do
    subject { member.valid? }

    let!(:other_member) { create(:member) }
    let(:member) { build(:member) }

    it "有効なデータの保存"do
      expect(FactoryBot.build(:member)).to be_valid
    end

    context "空白のバリデーション" do
      it "名前が空欄" do
        member.name = ""
        is_expected.to eq false
      end

      it "メールアドレスが空白" do
        member.email = ""
        is_expected.to eq false
      end

      it "パスワードが空白" do
        member.password = ""
        is_expected.to eq false
      end

    end

    context "データの一致" do
      it "パスワードの一致" do
        member.password = "123456"
        member.password_confirmation = "123456"
        is_expected.to eq true
      end

      it "パスワードの不一致" do
        member.password = "123456"
        member.password_confirmation = "123457"
        is_expected.to eq false
      end

    end

    context "名前の文字数のチェック" do
      it "名前の文字数が3文字未満" do
        member.name = Faker::Lorem.characters(number:2)
        is_expected.to eq false
      end

      it "名前の文字数が20文字以内" do
        member.name = Faker::Lorem.characters(number:20)
        is_expected.to eq true
      end

      it "名前の文字数が21文字以上" do
        member.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false
      end
    end

    context "名前の文字制限のチェック" do
      it "全半角英数字のみ入力" do
        member.name = "TaroYamada1"
        is_expected.to eq true
      end

      it "全角英字のみ入力" do
        member.name = "TAROYAMADA1"
        is_expected.to eq true
      end

      it "半角英字のみ入力" do
        member.name = "taroyamada1"
        is_expected.to eq true
      end

      it "数字のみ入力" do
        member.name = "123446"
        is_expected.to eq true
      end

      it "空欄の入力不可(半角)" do
        member.name = "TaroYmada 1"
        is_expected.to eq  false
      end

      it "日本語の入力不可(半角)" do
        member.name = "Taro山田1"
        is_expected.to eq  false
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
