class UsersController < ApplicationController
  def edit 
  end

  def update
    user = User.find(current_user.id)
    current_user.update(configure_permitted_parameters)
    if (user.name == current_user.name) && (user.email == current_user.email)
      render action: :edit
    else
      redirect_to action: :index, controller: :messages
    end
  end

  private
  def configure_permitted_parameters
    params.require(:user).permit(:name, :email)

  end

 
end
