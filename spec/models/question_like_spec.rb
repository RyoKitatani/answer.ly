require 'rails_helper'

RSpec.describe QuestionLike, type: :model do
  describe "データの保存" do
    subject { question_like.valid? }

    let(:member) { create(:member) }
    let!(:question) { build(:question, member_id: member.id) }
    let!(:question_like) { build(:question_like, question_id: question.id, member_id: member.id) }

    context "空白のバリデーション" do
      it "question_idがない場合" do
        question_like.question_id = ""
        is_expected.to eq false
      end

      it "member_idがない場合" do
        question_like.member_id = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'memberモデルとの関係' do
      it 'N:1となっている' do
        expect(QuestionLike.reflect_on_association(:member).macro).to eq :belongs_to
      end
    end

    context 'questionモデルとの関係' do
      it 'N:1となっている' do
        expect(QuestionLike.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end
  end
end
