require 'rails_helper'

RSpec.describe PackingListItem, type: :model do
  context "validations" do
    subject { build(:packing_list_item) }

    it "has a valid factory" do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:status) }
  end
end
