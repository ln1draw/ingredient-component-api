class Api::IngredientsController < Api::ApiController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: []
  respond_to :json

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def by_name
    @ingredient = Ingredient.where(name: params[:name])[0]
  end


  def new
    @ingredient = Ingredient.new
    components
  end

  def edit
    components
  end

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

  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
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

  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url }
      format.json { head :no_content }
    end
  end

  private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def components
    @components ||= Component.all.map {|component| [component.name, component.id]}
  end

  def add_components_to_ingredients
    puts params.inspect
    if params[:ingredient][:components]
      params[:ingredient][:components].each do |component_id|
        next if component_id.to_i == 0
        component = Component.find(component_id.to_i)
        @ingredient.components << component
      end
    end
  end

  
  def ingredient_params
    params.require(:ingredient).permit(:name, :verified, :components => {})
  end
end