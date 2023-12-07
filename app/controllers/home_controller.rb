class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def new_category
    redirect_to new_category_path
  end
end
