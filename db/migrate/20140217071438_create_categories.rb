class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :factual_data_id
      t.string :category_labels

      t.timestamps
    end
  end
end
