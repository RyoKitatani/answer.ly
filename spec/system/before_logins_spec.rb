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
  
end
