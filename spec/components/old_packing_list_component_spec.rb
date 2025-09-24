# frozen_string_literal: true

require "rails_helper"

RSpec.describe OldPackingListComponent, type: :component do
  include ViewComponent::TestHelpers

  let(:packing_list1) { double("PackingList", trip_date: "2023-01-01", name: "Trip 1", destination: "Paris") }
  let(:packing_list2) { double("PackingList", trip_date: "2023-02-01", name: "Trip 2", destination: "Rome") }
  let(:packing_lists) { double("PackingLists", past_dates: [ packing_list1, packing_list2 ]) }

  it "displays the heading" do
    result = render_inline(described_class.new(packing_lists: packing_lists))
    expect(result.text).to include("Here are your old packing lists:")
  end

  context "when past packing list exists" do
    it "renders component without errors" do
      expect {
        render_inline(described_class.new(packing_lists: packing_lists))
      }.not_to raise_error
    end

    it "renders a packing list" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).to have_text("Trip 1")
      expect(page).to have_text("Rome")
    end
  end
end
