require 'rails_helper'

RSpec.describe "Responses", type: :system do
  let(:member) { create(:member)}
  let(:other_member) { create(:member)}
  let!(:question) { create(:question, member_id: member.id) }
  let!(:answer) { create(:answer, member_id: member.id, question_id: question.id)}
  let!(:response) { create(:response, member_id: member.id, answer_id: answer.id)}


  describe 'ログイン前のテスト' do
    before do
      create :question
      create :answer
      visit question_path(id:1)
    end

    context 'コメントフォームの表示確認' do
      it '質問がある' do
        expect(page).to have_content question.title
      end

      it '回答がある' do
        expect(page).to have_content answer.content
      end

      it 'コメントフォームは表示されない' do
        expect(page).to have_no_field "response[content]"
      end
    end
  end

  describe 'ログイン後のテスト' do
    before do
      create :question
      create :answer
      visit new_member_session_path
      fill_in 'member[email]', with: other_member.email
      fill_in 'member[password]', with: other_member.password
      click_button "ログイン"
      visit question_path(id:1)
    end

    context '表示の確認' do
      it 'コメントフォームが表示されている' do
        expect(page).to have_field "response[content]"
      end

      it 'コメントするボタンが表示されている' do
        expect(page).to have_button "コメントする"
      end
    end

    context 'コメントの投稿テスト' do
      before do
        create :response
      end

      it '回答が表示されている' do
         expect(page).to have_content response.content
      end
      
      it 'コメント数が1と表示されている' do
         expect(page).to have_content 'コメント数：1件'
      end
      
      it 'コメントしたユーザー名が表示されている' do
         expect(page).to have_content response.member.name
      end
      
      it 'コメントした日付が表示されている' do
         expect(page).to have_content response.updated_at.strftime('%Y/%m/%d')
      end
      
    end
  end


end
