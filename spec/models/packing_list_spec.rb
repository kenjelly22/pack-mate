require 'rails_helper'

RSpec.describe PackingList, type: :model do
  context "validations" do
    subject { build(:packing_list) }

    it "has a valid factory" do
      expect(subject).to be_valid
    end

    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:destination) }
  end
end
