class AddsSubComponentIds < ActiveRecord::Migration
  def change
    add_column :components, :sub_component_ids, :string
  end
end
