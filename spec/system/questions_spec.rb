require 'rails_helper'

RSpec.describe "Questions", type: :system do
  let(:member) { create(:member)}
  let(:other_member) { create(:member)}
  let!(:question) { create(:question, member_id: member.id) }

  describe 'ログイン前のテスト' do
    context '質問一覧ページの表示テスト' do
      before do
        visit root_path
      end

      it '質問タイトルが表示されている' do
        expect(page).to have_content question.title
      end

      it '質問投稿者名が表示されている' do
        expect(page).to have_content question.member.name
      end

      it '質問の投稿日(0000/00/00)が表示されている' do
        expect(page).to have_content question.created_at.strftime('%Y/%m/%d')
      end
    end

    context '質問詳細ページの表示テスト' do
      before do
        visit question_path(id:1)
      end

      it '質問タイトルが表示されている' do
        expect(page).to have_content question.title
      end

      it '質問ステータス(受付)が表示されている' do
        expect(page).to have_content '受付中'
      end

      it '質問内容が表示されている' do
        expect(page).to have_content question.content
      end

      it '質問投稿者名が表示されている' do
        expect(page).to have_content question.member.name
      end

      it '質問の投稿日(0000/00/00)が表示されている' do
        expect(page).to have_content question.created_at.strftime('%Y/%m/%d')
      end

      it '質問の更新日日(0000/00/00)が表示されている' do
        expect(page).to have_content question.updated_at.strftime('%Y/%m/%d')
      end

      it '回答フォームが表示されている' do
        expect(page).to have_field 'answer[content]'
      end
    end

    context 'アクセス制限の確認' do
      it '質問一覧ページに飛べる' do
        visit root_path
        expect(current_path).to eq root_path
      end

      it '質問詳細ページに飛べる' do
        visit question_path(id:1)
        expect(current_path).to eq question_path(id:1)
      end

      it '質問投稿ページに飛ぶとログイン画面に飛ぶ' do
        visit new_question_path
        expect(current_path).to eq new_member_session_path
      end

      it '質問編集ページに飛ぶとログイン画面に飛ぶ' do
        visit edit_question_path(id:1)
        expect(current_path).to eq new_member_session_path
      end
    end
  end

  describe 'ログイン後のテスト' do
    context '質問詳細ページの表示テスト' do
      before do
        visit new_member_session_path
        fill_in 'member[email]', with: member.email
        fill_in 'member[password]', with: member.password
        click_button "ログイン"
        visit question_path(id:1)
      end

      it '質問タイトルが表示されている' do
        expect(page).to have_content question.title
      end

      it '質問ステータス(受付)が表示されている' do
        expect(page).to have_content '受付中'
      end

      it '質問内容が表示されている' do
        expect(page).to have_content question.content
      end

      it '質問投稿者名が表示されている' do
        expect(page).to have_content question.member.name
      end

      it '質問の投稿日(0000/00/00)が表示されている' do
        expect(page).to have_content question.created_at.strftime('%Y/%m/%d')
      end

      it '質問の更新日日(0000/00/00)が表示されている' do
        expect(page).to have_content question.updated_at.strftime('%Y/%m/%d')
      end

      it '投稿編集リンクが表示されている' do
        expect(page).to have_link '編集する', href: edit_question_path(id:1)
      end

      it '削除するが表示されている' do
        expect(page).to have_content '削除する'
      end

      it '回答フォームが表示されている' do
        expect(page).to have_field 'answer[content]'
      end

      it '高評価が表示されている' do
        expect(page).to have_content '高評価'
      end
    end

    context '他ユーザーの投稿詳細ページの表示テスト' do
      before do
        visit new_member_session_path
        fill_in 'member[email]', with: other_member.email
        fill_in 'member[password]', with: other_member.password
        click_button "ログイン"
        visit question_path(id:1)
      end

      it '質問タイトルが表示されている' do
        expect(page).to have_content question.title
      end

      it '質問ステータス(受付)が表示されている' do
        expect(page).to have_content '受付中'
      end

      it '質問内容が表示されている' do
        expect(page).to have_content question.content
      end

      it '質問投稿者名が表示されている' do
        expect(page).to have_content question.member.name
      end

      it '質問の投稿日(0000/00/00)が表示されている' do
        expect(page).to have_content question.created_at.strftime('%Y/%m/%d')
      end

      it '質問の更新日日(0000/00/00)が表示されている' do
        expect(page).to have_content question.updated_at.strftime('%Y/%m/%d')
      end

      it '投稿編集リンクが表示されない' do
        expect(page).to have_no_link '編集する', href: edit_question_path(id:1)
      end

      it '削除するが表示されない' do
        expect(page).to have_no_content '削除する'
      end
    end

    context 'アクセス制限の確認' do
      before do
        visit new_member_session_path
        fill_in 'member[email]', with: member.email
        fill_in 'member[password]', with: member.password
        click_button "ログイン"
      end
      
      it '質問投稿ページに飛べる' do
        visit new_question_path
        expect(current_path).to eq new_question_path
      end

      it '質問編集ページに飛べる' do
        visit edit_question_path(id:1)
        expect(current_path).to eq edit_question_path(id:1)
      end
    end

    context '質問投稿のテスト' do
      before do
        visit new_member_session_path
        fill_in 'member[email]', with: member.email
        fill_in 'member[password]', with: member.password
        click_button "ログイン"
        visit new_question_path
      end
      
      it '質問投稿のURLが正しい' do
        expect(current_path).to eq new_question_path
      end

      it 'タイトルフォームが表示される' do
        expect(page).to have_field 'question[title]'
      end

      it '質問内容フォームが表示される' do
        expect(page).to have_field 'question[content]'
      end

      it '質問するボタンが表示されている' do
        expect(page).to have_button '質問する'
      end
      
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'question[title]', with: Faker::Lorem.characters(number: 5)
        fill_in 'question[content]', with: Faker::Lorem.characters(number: 20)
        click_button '質問する'
        expect(current_path).to eq question_path(id:2)
      end
    end
    
  end
  
end
