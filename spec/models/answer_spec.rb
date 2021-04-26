require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "データの保存" do
    subject { answer.valid? }

    let(:member) { create(:member) }
    let!(:question) { build(:question, member_id: member.id) }
    let!(:answer) { build(:answer, member_id: member.id, question_id: question.id) }

    context "空白のバリデーション" do
      it "回答内容が空欄" do
        answer.content = ""
        is_expected.to eq false
      end

      it "question_idがない場合" do
        answer.question_id = ""
        is_expected.to eq false
      end

      it "member_idがない場合" do
        answer.member_id = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'memberモデルとの関係' do
      it 'N:1となっている' do
        expect(Answer.reflect_on_association(:member).macro).to eq :belongs_to
      end
    end

    context 'questionモデルとの関係' do
      it 'N:1となっている' do
        expect(Answer.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end

    context 'answer_likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Answer.reflect_on_association(:answer_likes).macro).to eq :has_many
      end
    end

    context 'questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(Answer.reflect_on_association(:responses).macro).to eq :has_many
      end
    end
  end
end
