class ProfilesController < ApplicationController
  def show
  	#instance variables are set with an @. Avaliable to views as well, when set in a controller
  	@user = User.find_by_profile_name(params[:id])
  	if @user  
  	  @statuses = @user.statuses.all 
  	  render action: :show
  	else
  	  render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end
