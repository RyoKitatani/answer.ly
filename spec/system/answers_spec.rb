require 'rails_helper'

RSpec.describe "Answers", type: :system do
  let(:member) { create(:member)}
  let(:other_member) { create(:member)}
  let!(:question) { create(:question, member_id: member.id) }
  let!(:answer) { create(:answer, member_id: member.id, question_id: question.id)}


  describe 'ログイン後のテスト' do
    before do
      visit new_member_session_path
      fill_in 'member[email]', with: member.email
      fill_in 'member[password]', with: member.password
      click_button "ログイン"
    end

    context '質問詳細ページの表示テスト' do
      it '回答フォームが表示されている' do
         visit question_path(id:1)
        expect(page).to have_field 'answer[content]'
      end

      it '回答するボタンが表示されている' do
         visit question_path(id:1)
        expect(page).to have_button '回答する'
      end

    end
  end

  describe '質問者以外での回答テスト' do
    before do
      visit new_member_session_path
      fill_in 'member[email]', with: other_member.email
      fill_in 'member[password]', with: other_member.password
      click_button "ログイン"
      visit question_path(id:1)
      fill_in 'answer[content]', with: Faker::Lorem.characters(number: 20)
      click_button '回答する'
    end

    context '回答投稿のテスト' do
      it 'リダイレクト先がのURLが正しい' do
        expect(current_path).to eq question_path(id:1)
      end

      it '回答内容がが表示される' do
        expect(page).to have_content answer.content
      end

      it '高評価ボタンが表示される' do
        expect(page).to have_content "高評価"
      end

      it 'ベストアンサーにするは表示されない。' do
        expect(page).to have_no_content "ベストアンサーにする"
      end

      it '回答日時が表示される' do
        expect(page).to have_content answer.created_at.strftime('%Y/%m/%d')
      end

      it '回答したユーザー名が表示される' do
        expect(page).to have_content answer.member.name
      end

      it '回答数が表示される' do
        expect(page).to have_content question.answers.count
      end

      it 'コメント数：と表示される' do
        expect(page).to have_content "コメント数"
      end

      it '現在のコメント数が表示される' do
        expect(page).to have_content answer.responses.count
      end

      it 'もっと見る....と表示される' do
        expect(page).to have_content "もっと見る...."
      end

      it 'コメントフォームが表示される' do
        expect(page).to have_field "response[content]"
      end

      it 'コメントするボタンが表示されている' do
        expect(page).to have_button "コメントする"
      end
    end
  end
end
