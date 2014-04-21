# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Component.create([
    {id: 1, name: 'corn', basic: true, verified: true},
    {id: 2, name: 'salt', basic: true, verified: true},
    {id: 3, name: 'low fructose corn syrup', basic: false, verified: false, sub_component_ids: '1'},
    {id: 4, name: 'cow dairy', basic: true, verified: true},
    {id: 5, name: 'butter', basic: false, verified: false, sub_component_ids: '2,4'},
    {id: 6, name: 'gluten', basic: true, verified: true},
    {id: 7, name: 'wheat', basic: false, verified: true, sub_component_ids: '6'},
    {id: 8, name: 'barley', basic: false, verified: false, sub_component_ids: '6'},
    {id: 9, name: 'all-purpose flour', basic: false, verified: false, sub_component_ids: '6,7,8'},
    {id: 10, name: 'sugar', basic: true, verified: false},
    {id: 11, name: 'egg', basic: true, verified: true},
    {id: 12, name: 'molasses', basic: false, verified: false, sub_component_ids: '10'},
    {id: 13, name: 'brown sugar', basic: false, verified: false, sub_component_ids: '12,10'},
    {id: 14, name: 'nuts', basic: true, verified: true},
    {id: 15, name: 'pecans', basic: false, verified: true, sub_component_ids: '14'},
    {id: 16, name: 'ethyl alcohol', basic: false, verified: false},
    {id: 17, name: 'vanilla bean', basic: true, verified: true},
    {id: 18, name: 'pure vanilla extract', basic: false, verified: false, sub_component_ids: '16,17'},
    {id: 19, name: 'banana', basic: true, verified: true},
    {id: 20, name: 'heavy cream', basic: false, verified: false, sub_component_ids: '4'}
  ])

Ingredient.create([
    {id: 1, name: 'corn', verified: true},
    {id: 2, name: 'salt', verified: true},
    {id: 3, name: 'low fructose corn syrup', verified: false},
    {id: 4, name: 'butter', verified: false},
    {id: 5, name: 'all-purpose flour', verified: false},
    {id: 6, name: 'sugar', verified: false},
    {id: 7, name: 'egg', verified: true},
    {id: 8, name: 'brown sugar', verified: false},
    {id: 9, name: 'pecans', verified: true},
    {id: 10, name: 'pure vanilla extract', verified: false},
    {id: 11, name: 'heavy cream', verified: false}
  ])

ComponentIngredient.create([
    {component_id: 1, ingredient_id: 1},
    {component_id: 2, ingredient_id: 2},
    {component_id: 3, ingredient_id: 3},
    {component_id: 1, ingredient_id: 3},
    {component_id: 2, ingredient_id: 4},
    {component_id: 4, ingredient_id: 4},
    {component_id: 5, ingredient_id: 4},
    {component_id: 6, ingredient_id: 5},
    {component_id: 7, ingredient_id: 5},
    {component_id: 8, ingredient_id: 5},
    {component_id: 9, ingredient_id: 5},
    {component_id: 10, ingredient_id: 6},
    {component_id: 11, ingredient_id: 7},
    {component_id: 10, ingredient_id: 8},
    {component_id: 12, ingredient_id: 8},
    {component_id: 13, ingredient_id: 8},
    {component_id: 14, ingredient_id: 9},
    {component_id: 15, ingredient_id: 9},
    {component_id: 16, ingredient_id: 10},
    {component_id: 17, ingredient_id: 10},
    {component_id: 18, ingredient_id: 10},
    {component_id: 19, ingredient_id: 11},
    {component_id: 4, ingredient_id: 11}
  ])
