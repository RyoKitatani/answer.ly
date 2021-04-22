require 'rails_helper'

RSpec.describe QuestionTag, type: :model do
  
  describe "データの保存" do
    subject { question_tag.valid? }
    
    let(:member) { create(:member) }
    let!(:question) { build(:question, member_id: member.id) }
    let!(:tag) { create(:tag) }
    let!(:question_tag) { build(:question_tag, question_id: question.id, tag_id: tag.id) }
    
    context "空白のバリデーション" do
      it "question_idがない場合" do
        question_tag.question_id = ""
        is_expected.to eq false
      end
      
      it "tag_idがない場合" do
        question_tag.tag_id = ""
        is_expected.to eq false
      end
    end
  end
  
  describe 'アソシエーションのテスト' do
    context 'questionモデルとの関係' do
      it 'N:1となっている' do
        expect(QuestionTag.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end
    
    context 'tagモデルとの関係' do
      it 'N:1となっている' do
        expect(QuestionTag.reflect_on_association(:tag).macro).to eq :belongs_to
      end
    end
  end
  
end
