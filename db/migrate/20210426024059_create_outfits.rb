class CreateOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :outfits do |t|
      t.string :name
      t.string :tops 
      t.string :bottoms
      t.integer :user_id
    end 
  end
end
