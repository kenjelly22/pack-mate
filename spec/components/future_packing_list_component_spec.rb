# frozen_string_literal: true

require "rails_helper"

RSpec.describe FuturePackingListComponent, type: :component do
  include ViewComponent::TestHelpers

  context "when future packing lists exist" do
    let(:packing_list1) { double("PackingList", trip_date: "2027-01-01", name: "Trip 1", destination: "London") }
    let(:packing_list2) { double("PackingList", trip_date: "2027-02-01", name: "Trip 2", destination: "Cancun") }
    let(:packing_lists) { double("PackingLists", future_dates: [ packing_list1, packing_list2 ]) }

    it "renders future without errors" do
      expect {
        render_inline(described_class.new(packing_lists: packing_lists))
      }.not_to raise_error
    end

    it "renders a packing list" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).to have_text("Trip 1")
      expect(page).to have_text("London")
    end

    it "displays the heading" do
      render_inline(described_class.new(packing_lists: packing_lists))
      expect(page).to have_text("Here are your packing lists:")
    end

    it "renders a ul tag" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).to have_css("ul")
    end

    it "renders a delete button" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).to have_css("button")
    end

    it "renders the correct number of li tags" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).to have_css("li", count: packing_lists.future_dates.count)
    end
  end

  context "when future packing lists do not exist" do
    let(:packing_lists) { double("PackingLists", future_dates: []) }
    it "renders nothing" do
      render_inline(described_class.new(packing_lists: packing_lists))

      expect(page).not_to have_css("*")
      expect(page.text).to be_empty
    end
  end
end
