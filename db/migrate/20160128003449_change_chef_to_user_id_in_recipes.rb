class ChangeChefToUserIdInRecipes < ActiveRecord::Migration
  def change
  	remove_column :recipes, :chef, :string
  	add_column :recipes, :user_id, :integer
  end
end
