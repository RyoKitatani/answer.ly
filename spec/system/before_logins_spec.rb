require 'rails_helper'

RSpec.describe "BeforeLogins", type: :system do
  
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq root_path
      end
    end
    
    context 'ログイン前: ヘッダーの表示内容' do
      it 'Anwer.lyロゴが表示される' do
        expect(page).to have_link "", href: root_path
      end
      
      it '新規登録のリンクが表示される' do
        expect(page).to have_link "", href: new_member_registration_path
      end
      
      it 'ログインのリンクが表示される' do
        expect(page).to have_link "", href: new_member_session_path
      end
      
      it 'ゲストログインのリンクが表示される' do
        expect(page).to have_link "", href: guest_sign_in_path
      end
      
      it '質問するのリンクが表示される' do
        expect(page).to have_link "", href: new_question_path
      end
    end
    
    context 'ログイン前: フッターの表示内容' do
      it 'Anwer.lyについてのリンクが表示される' do
        expect(page).to have_link "", href: about_path
      end
      
      it 'タグ一覧のリンクが表示される' do
        expect(page).to have_link "", href: tags_path
      end
      
      it 'ランキング一覧のリンクが表示される' do
        expect(page).to have_link "", href: members_path
      end
      
      it 'お問い合わせのリンクが表示される' do
        expect(page).to have_link "", href: new_contact_path
      end
    end
  end
  
  describe '新規登録のテスト' do
    before do
      visit new_member_registration_path
    end
    
    context '表示内容の確認(メールアドレス登録)' do
      it 'URLが正しい' do
        expect(current_path).to eq new_member_registration_path
      end
      
      it '新規登録と表示される' do
        expect(page).to have_content '新規会員登録'
      end
      
      it 'ユーザー名フォームが表示される' do
        expect(page).to have_field 'member[name]'
      end
      
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'member[email]'
      end
      
      it 'パスワードフォームが表示される' do
        expect(page).to have_field 'member[password]'
      end
      
      it 'パスワード確認フォームが表示される' do
        expect(page).to have_field 'member[password_confirmation]'
      end
      
      it '新規登録するボタンが表示される' do
        expect(page).to have_button '登録する'
      end
    end
    
    context '表示内容の確認(SNS登録)' do
      it 'Facebookアカウント登録リンクが表示される' do
        expect(page).to have_link "", href: member_facebook_omniauth_authorize_path
      end
      
      it 'Twiiterアカウント登録リンクが表示される' do
        expect(page).to have_link "", href: member_twitter_omniauth_authorize_path
      end
      
      it 'Googleアカウント登録リンクが表示される' do
        expect(page).to have_link "", href: member_google_oauth2_omniauth_authorize_path
      end
    end 
    
    context '新規登録成功のテスト' do
      before do
        fill_in 'member[name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'member[email]', with: Faker::Internet.email
        fill_in 'member[password]', with: 'password'
        fill_in 'member[password_confirmation]', with: 'password'
      end
      
      it '新規登録が成功する' do
        expect { click_button '登録する' }.to change(Member.all, :count).by(1)
      end
      
      it '新規登録後のリダイレクト先が、トップ画面に遷移する' do
        click_button '登録する'
        expect(current_path).to eq root_path
      end
    end
    
    context '新規登録失敗後のテスト' do
      before do
        fill_in 'member[name]', with: ""
        fill_in 'member[email]', with: ""
        fill_in 'member[password]', with: ""
        fill_in 'member[password_confirmation]', with: ''
      end
      
      it '新規登録後のリダイレクト先が、トップ画面に遷移する' do
        click_button '登録する'
        expect(current_path).to eq members_path
      end
    end
    
  end
  
  
  describe 'ログインのテスト' do
    let(:member) { create(:member) }

    before do
      visit new_member_session_path
    end
    
    context '表示内容の確認(Answer.lyアカウントログイン)' do
      it 'URLが正しい' do
        expect(current_path).to eq new_member_session_path
      end
      
      it 'ログインと表示される' do
        expect(page).to have_content 'ログイン'
      end
      
      it 'メールアドレスのフォームが表示される' do
        expect(page).to have_field 'member[email]'
      end
      
      it 'パスワードフォームが表示される' do
        expect(page).to have_field 'member[password]'
      end
      
      it 'Remembermeボックスが表示される' do
        expect(page).to have_content 'Remember me'
      end
      
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      
    end
    
    context '表示内容の確認(SNSログイン)' do
      it 'Facebookでログインリンクが表示される' do
        expect(page).to have_link "", href: member_facebook_omniauth_authorize_path
      end
      
      it 'Twiiterでログインリンクが表示される' do
        expect(page).to have_link "", href: member_twitter_omniauth_authorize_path
      end
      
      it 'Googleでログインリンクが表示される' do
        expect(page).to have_link "", href: member_google_oauth2_omniauth_authorize_path
      end
    end 
    
    context 'ログイン成功後のテスト' do
      before do
        fill_in 'member[email]', with: member.email
        fill_in 'member[password]', with: member.password
      end
      
      it 'ログイン後のリダイレクト先が、トップ画面になっている' do
        click_button 'ログイン'
        expect(current_path).to eq root_path
      end
    end
    
    context 'ログイン失敗後のテスト' do
      before do
        fill_in 'member[email]', with: ""
        fill_in 'member[password]', with: ""
      end

      it 'ログイン失敗後のリダイレクト先が、ログイン画面である' do
        click_button 'ログイン'
        expect(current_path).to eq new_member_session_path
      end
    end
  end
  
end
