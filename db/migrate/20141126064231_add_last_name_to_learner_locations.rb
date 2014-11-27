class AddLastNameToLearnerLocations < ActiveRecord::Migration
  def change
    add_column :learner_locations, :last_name, :string
    rename_column :learner_locations, :name, :first_name
  end
end
