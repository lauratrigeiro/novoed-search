class RenameLearnerLocationsToUsers < ActiveRecord::Migration
  def change
  	rename_table :learner_locations, :users
  end
end
