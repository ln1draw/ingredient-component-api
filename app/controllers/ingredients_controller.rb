class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
  end

  def by_name
    @ingredient = Ingredient.where(name: params[:name])[0]
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
    components
  end

  # GET /ingredients/1/edit
  def edit
    components
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    add_components_to_ingredients

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { 
          @ingredient.update(verified: false)
          render action: 'show', status: :created, location: @ingredient 
        }
      else
        components
        format.html { render action: 'new' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update

    respond_to do |format|
      if @ingredient.update(ingredient_params)
        add_components_to_ingredients
        
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { 
          @ingredient.update(verified: false)
          head :no_content 
        }
      else
        components
        format.html { render action: 'edit' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def unverified
    @ingredients = Ingredient.where(verified: false)
    @components = Component.where(verified: false)
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def components
      @components ||= Component.all.map {|component| [component.name, component.id]}
    end

    def add_components_to_ingredients
      if params[:ingredient][:components]
        params[:ingredient][:components].each do |component_id|
          next if component_id.to_i == 0
          component = Component.find(component_id.to_i)
          @ingredient.components << component
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :verified, :components => {})
    end
end
