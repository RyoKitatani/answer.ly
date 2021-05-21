require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "データの保存" do
    subject { admin.valid? }

    let(:admin) { build(:admin) }

    it "有効なデータの保存" do
      expect(FactoryBot.build(:admin)).to be_valid
    end
  end
end
