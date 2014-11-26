class LearnerLocationsController < ApplicationController
  def search
  	@learner_locations = LearnerLocation.all
  end
end
