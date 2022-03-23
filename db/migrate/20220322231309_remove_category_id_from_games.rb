class RemoveCategoryIdFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :category_id
  end
end
