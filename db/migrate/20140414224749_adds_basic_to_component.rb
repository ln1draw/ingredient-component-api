class AddsBasicToComponent < ActiveRecord::Migration
  def change
    add_column :components, :basic, :boolean
  end
end
