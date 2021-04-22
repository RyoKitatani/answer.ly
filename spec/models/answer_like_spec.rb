require 'rails_helper'

RSpec.describe AnswerLike, type: :model do
  describe "データの保存" do
    subject { answer_like.valid? }
    
    let(:member) { create(:member) }
    let!(:question) { build(:question, member_id: member.id) }
    let!(:answer) { build(:answer, member_id: member.id, question_id: question.id) }
    let!(:answer_like) { build(:answer_like, answer_id: answer.id, member_id: member.id) }
    
    context "空白のバリデーション" do
      it "answeridがない場合" do
        answer_like.answer_id = ""
        is_expected.to eq false
      end
      
      it "member_idがない場合" do
        answer_like.member_id = ""
        is_expected.to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'memberモデルとの関係' do
      it 'N:1となっている' do
        expect(AnswerLike.reflect_on_association(:member).macro).to eq :belongs_to
      end
    end
    
    context 'answerモデルとの関係' do
      it 'N:1となっている' do
        expect(AnswerLike.reflect_on_association(:answer).macro).to eq :belongs_to
      end
    end
  end
end
