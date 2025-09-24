# frozen_string_literal: true

require "rails_helper"

RSpec.describe OldPackingListComponent, type: :component do
  include ViewComponent::TestHelpers

  context "when past packing lists exist" do
    let(:packing_list1) { double("PackingList", trip_date: "2023-01-01", name: "Trip 1", destination: "Paris") }
    let(:packing_list2) { double("PackingList", trip_date: "2023-02-01", name: "Trip 2", destination: "Rome") }
    let(:packing_lists) { double("PackingLists", past_dates: [ packing_list1, packing_list2 ]) }

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

    it "displays the heading" do
      render_inline(described_class.new(packing_lists: packing_lists))
      expect(page).to have_text("Here are your old packing lists:")
    end

    it "renders a ul tag" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).to have_css("ul")
    end

    it "renders the correct number of li tags" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).to have_css("li", count: packing_lists.past_dates.count)
    end
  end

  context "when past packing lists do not exist" do
    let(:packing_lists) { double("PackingLists", past_dates: []) }
    it "renders nothing" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).not_to have_css("*")
      expect(page.text).to be_empty
    end
  end
end
