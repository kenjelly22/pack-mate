class CurrentPackingListComponent < ViewComponent::Base
  def initialize(packing_lists:)
    @packing_lists = packing_lists
  end
end
