class ItemsController < ApplicationController
  before_action :authenticate_user! # Ensure the user is signed in
  before_action :set_category, only: %i[new create show]

  def new
    @category = Category.includes(:user).find_by(id: params[:category_id])
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(items_params)
    @item.author = current_user

    if @item.save
      selected_category_id = params[:item][:category_id]
      @item.categories << Category.find(selected_category_id)
      flash[:notice] = 'Created successfully'
    else
      flash[:alert] = 'Failed to create'
    end

    redirect_to category_path(selected_category_id)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def items_params
    params.require(:item).permit(:name, :amount)
  end
end
