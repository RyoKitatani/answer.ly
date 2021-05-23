require 'rails_helper'

RSpec.describe Notification, type: :model do

  describe 'アソシエーションのテスト' do
    context 'questionモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:question).macro).to eq :belongs_to
      end
    end

    context 'answerモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:answer).macro).to eq :belongs_to
      end
    end

    context 'resposeモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:response).macro).to eq :belongs_to
      end
    end

     context 'relationshipp(visitor)モデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:visitor).macro).to eq :belongs_to
      end
    end

     context 'relationshipp(visited)モデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:visited).macro).to eq :belongs_to
      end
    end

  end
end
