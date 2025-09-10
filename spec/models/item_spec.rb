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

  context "scopes" do
    describe ".generic" do
      it "should return items not owned by a user" do
        item = create(:item)
        item2 = create(:item)

        generic_items = described_class.generic

        expect(generic_items).to eq([ item, item2 ])
      end

      it "should not return items owned by a user" do
        user = create(:user)
        create(:item, user: user)

        generic_items = described_class.generic

        expect(generic_items).to be_empty
      end
    end
  end
end
