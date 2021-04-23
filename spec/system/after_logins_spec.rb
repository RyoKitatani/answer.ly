require 'rails_helper'

RSpec.describe "AfterLogins", type: :system do

  describe 'ログイン後のテスト' do
    let(:member) { create(:member)}
    # let!(:question) { FactoryBot.create(:question, member_id: member.id) }

    before do
      visit new_member_session_path
      fill_in 'member[email]', with: member.email
      fill_in 'member[password]', with: member.password
      click_button "ログイン"
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq root_path
      end
    end

    describe 'ログイン後: ヘッダーのテスト' do
      context '表示内容' do
        it 'Anwer.lyロゴが表示される' do
          expect(page).to have_link "", href: root_path
        end

        it '検索フォームが表示される' do
          expect(page).to have_field 'content'
        end

        it '検索するボタンが表示される' do
          expect(page).to have_button '検索する'
        end

        it 'ログアウトのリンクが表示される' do
          expect(page).to have_link "", href: destroy_member_session_path
        end

        it '質問するのリンクが表示される' do
          expect(page).to have_link "", href: new_question_path
        end

        it 'マイページリンクが表示される' do
          expect(page).to have_link "", href: member_path(member.id)
        end

        it 'メンバーのプロフィール画像が表示される' do
          expect(page).to have_selector ("img[src$='no_image_icon-f921c6af5ead36718bbc0580582c4af5dede50b5fb0ef0ead93c6da2feb978d8.jpg']")
        end
      end
    end

  end
end
