require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category) }

    # it "is valid with valid attributes" do
    #   expect(Item.new).to be_valid
    # end

    it "is not valid without a name" do
      item = build(:item)
      item.name = nil
      expect(item).not_to be_valid
    end

    # it "is not valid without a category" do
    # end
  end
end
