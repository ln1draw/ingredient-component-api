class ComponentIngredientsController < ApplicationController
  before_action :set_component_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /component_ingredients
  # GET /component_ingredients.json
  def index
    @component_ingredients = ComponentIngredient.all
  end

  # GET /component_ingredients/1
  # GET /component_ingredients/1.json
  def show
  end

  # GET /component_ingredients/new
  def new
    @component_ingredient = ComponentIngredient.new
  end

  # GET /component_ingredients/1/edit
  def edit
  end

  # POST /component_ingredients
  # POST /component_ingredients.json
  def create
    @component_ingredient = ComponentIngredient.new(component_ingredient_params)

    respond_to do |format|
      if @component_ingredient.save
        format.html { redirect_to @component_ingredient, notice: 'Component ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @component_ingredient }
      else
        format.html { render action: 'new' }
        format.json { render json: @component_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_ingredients/1
  # PATCH/PUT /component_ingredients/1.json
  def update
    respond_to do |format|
      if @component_ingredient.update(component_ingredient_params)
        format.html { redirect_to @component_ingredient, notice: 'Component ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @component_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_ingredients/1
  # DELETE /component_ingredients/1.json
  def destroy
    @component_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to component_ingredients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_ingredient
      @component_ingredient = ComponentIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_ingredient_params
      params.require(:component_ingredient).permit(:component_id, :ingredient_id)
    end
end
