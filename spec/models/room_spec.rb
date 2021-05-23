require 'rails_helper'

RSpec.describe Room, type: :model do

  describe 'アソシエーションのテスト' do

    context 'entryモデルとの関係' do
      it '1:Nとなっている' do
        expect(Room.reflect_on_association(:entries).macro).to eq :has_many
      end
    end

    context 'messageモデルとの関係' do
      it '1:Nとなっている' do
        expect(Room.reflect_on_association(:messages).macro).to eq :has_many
      end
    end

  end

end
