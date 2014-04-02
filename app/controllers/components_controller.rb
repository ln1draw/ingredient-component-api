class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  # GET /components
  # GET /components.json
  def index
    @components = Component.all
  end

  # GET /components/1
  # GET /components/1.json
  def show
  end

  # GET /components/new
  def new
    @component = Component.new
  end

  # GET /components/1/edit
  def edit
  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(component_params)
    if @component.save
      redirect_to @component, notice: 'Component was successfully created.'    
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /components/1
  # PATCH/PUT /components/1.json
  def update
    if @component.update(component_params)
      redirect_to @component, notice: 'Component was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component.destroy
    redirect_to components_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component
      @component = Component.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_params
      params.require(:component).permit(:name, :verified)
    end
end
