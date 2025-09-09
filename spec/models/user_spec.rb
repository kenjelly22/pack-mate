require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    subject { build(:user) }

    it "has a valid factory" do
      expect(subject).to be_valid
    end
  end
end
