class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :english_name
      t.string :chinese_name
      t.string :logo
      t.integer :rank
      t.string :country
      t.string :city
      t.string :tuition_fees
      t.text :introduction
      t.string :world_working
      t.string :national_ranking
      t.string :cost_of_living
      t.string :link
      t.text :address
      t.string :acronym

      t.timestamps null: false
    end
  end
end
