class Api::V1::Admin::CategoriesController < Api::V1::Admin::AdminHomeController
  before_action :set_category, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session
  # GET /categories or /categories.json
  def index
    @categories = Category.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
    
    render json: @categories ,status: :ok 
  end

  # GET /categories/1 or /categories/1.json
  def show
    render json: {category: @category, id: params[:id],Hello: params[:Hello]},status: :ok 
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    # @category = Category.new(category_params)

    # respond_to do |format|
    #   if @category.save
    #     format.html { redirect_to admin_category_url(@category), notice: "Category was successfully created." }
    #     format.json { render :show, status: :created, location: @category }
    #     format.js
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #     format.js
    #   end
    # end

    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    # respond_to do |format|
    #   if @category.update(category_params)
    #     format.html { redirect_to admin_category_url(@category), notice: "Category was successfully updated." }
    #     format.json { render :show, status: :ok, location: @category }
    #     format.js
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #     format.js
    #   end
    # end
    if @category.update(category_params)
      # debugger
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end

  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    # @category.destroy

    # respond_to do |format|
    #   format.html { redirect_to admin_categories_url, notice: "Category was successfully destroyed." }
    #   format.json { head :no_content }
    #   format.js
    # end
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.fetch(:category, {}).permit(:Type, :avatar)
    end
end
