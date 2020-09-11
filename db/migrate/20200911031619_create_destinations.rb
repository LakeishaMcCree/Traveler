class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.integer :user_id
      t.integer :city_id
      t.integer :rating
      t.string :fave_attraction
      t.text :comment
      
      t.timestamps
    end
  end
end
