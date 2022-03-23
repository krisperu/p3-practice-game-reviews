class CreateGameCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :game_categories do |t|
      t.references :game
      t.references :category
    end
  end
end
