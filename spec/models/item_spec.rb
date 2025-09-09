require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    subject { build(:item) }

    it "has a valid factory" do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:category) }
  end
end
