class CreateLearnerLocations < ActiveRecord::Migration
  def change
    create_table :learner_locations do |t|
      t.string :name
      t.string :country
      t.string :state
      t.string :city

      t.timestamps
    end
    add_index :learner_locations, :country
    add_index :learner_locations, :state
    add_index :learner_locations, :city
  end
end
