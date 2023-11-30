class ItemsController < ApplicationController
  before_action :authenticate_user! # Ensure the user is signed in
  before_action :set_category, only: [:new, :create, :show]

  def new
    @item = @category.items.build
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = @category.items.build(item_params)
    @item.author_id = current_user.id

    if @item.save
      redirect_to category_path(@category), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
