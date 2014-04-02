require 'test_helper'

class ComponentIngredientsControllerTest < ActionController::TestCase
  setup do
    @component_ingredient = component_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:component_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create component_ingredient" do
    assert_difference('ComponentIngredient.count') do
      post :create, component_ingredient: { component_id: @component_ingredient.component_id, ingredient_id: @component_ingredient.ingredient_id }
    end

    assert_redirected_to component_ingredient_path(assigns(:component_ingredient))
  end

  test "should show component_ingredient" do
    get :show, id: @component_ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @component_ingredient
    assert_response :success
  end

  test "should update component_ingredient" do
    patch :update, id: @component_ingredient, component_ingredient: { component_id: @component_ingredient.component_id, ingredient_id: @component_ingredient.ingredient_id }
    assert_redirected_to component_ingredient_path(assigns(:component_ingredient))
  end

  test "should destroy component_ingredient" do
    assert_difference('ComponentIngredient.count', -1) do
      delete :destroy, id: @component_ingredient
    end

    assert_redirected_to component_ingredients_path
  end
end
