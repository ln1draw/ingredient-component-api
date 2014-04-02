class AddsVerifiedColumns < ActiveRecord::Migration
  def change
    add_column :ingredients, :verified, :boolean, default: false
    add_column :components, :verified, :boolean, default: false
  end
end
