class UsersController < ApplicationController
  def search
  	@users = User.paginate(page: params[:page])
  end
end
