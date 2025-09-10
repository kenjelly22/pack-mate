class PackingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @packing_lists = PackingList.all
  end
end
