class CreateFactualData < ActiveRecord::Migration
  def change
    create_table :factual_data do |t|
      t.string :name
      t.text :address
      t.string :locality
      t.string :country
      t.string :website
      t.integer :postal_code

      t.timestamps
    end
  end
end
