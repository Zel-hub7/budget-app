class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html do
          if user_signed_in?
            redirect_to authenticated_root_path, notice: 'Category was successfully created.'
          else
            redirect_to unauthenticated_root_path, notice: 'Category was successfully created.'
          end
        end
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    icon_name = params.require(:category).fetch(:icon, '')
    icon_link = Category::ICONS[icon_name]

    params.require(:category).permit(:name, :user_id).merge(icon: icon_link)
  end
end
