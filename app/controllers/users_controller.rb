class UsersController < ApplicationController
  def search
#  	@users = User.paginate(page: params[:page])
	@users = User.all
	@users = if params[:search_by] == 'city'
      			@users.where("city ILIKE ?", "%#{params[:query]}%")
      		elsif params[:search_by] == 'state'
      			@users.where("state ILIKE ?", "%#{params[:query]}%")
      		elsif params[:search_by] == 'country'
      			@users.where("country ILIKE ?", "%#{params[:query]}%")
  			end
 	@users = @users.paginate(page: params[:page]) if  @users && @users.any?
  end
end

