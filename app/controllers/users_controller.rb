class UsersController < ApplicationController
  def search
    if params[:query]
      @users = User.search(params[:search_by], params[:query])
     	@users = @users.paginate(page: params[:page]) if  @users && @users.any?
    end
  end
end

