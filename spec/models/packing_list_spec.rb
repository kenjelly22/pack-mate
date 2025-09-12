require 'rails_helper'

RSpec.describe PackingList, type: :model do
  context "validations" do
    subject { build(:packing_list) }

    it "has a valid factory" do
      expect(subject).to be_valid
    end

    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:destination) }

    it { should validate_presence_of(:trip_date) }
  end

  context "user dashboard" do
    it "should return packing lists owned by a user" do
      user = create(:user)
      packing_list = create(:packing_list, user: user)

      owner_lists = user.packing_lists

      expect(owner_lists).to include(packing_list)
    end

    it "should not return packing lists not owned by a user" do
      user = create(:user)
      other_user = create(:user)

      create(:packing_list, user: other_user)

      owner_lists = user.packing_lists

      expect(owner_lists).to be_empty
    end
  end
end
