require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "データの保存" do
    subject { question.valid? }

    let(:member) { create(:member) }
    let!(:question) { build(:question, member_id: member.id) }

    context "空白のバリデーション" do
      it "タイトルが空欄" do
        question.title = ""
        is_expected.to eq false
      end

      it "質問内容が空欄" do
        question.content = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'memberモデルとの関係' do
      it 'N:1となっている' do
        expect(Question.reflect_on_association(:member).macro).to eq :belongs_to
      end
    end

    context 'question_likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:question_likes).macro).to eq :has_many
      end
    end

    context 'question_tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:question_tags).macro).to eq :has_many
      end
    end

    context 'answerモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:answers).macro).to eq :has_many
      end
    end
  end
end
