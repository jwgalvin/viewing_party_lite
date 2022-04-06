class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  def show
    if params.include?("party_id") 
     @user = User.find(params[:id])
     change_status(params[:party_id])
    else
      @user = User.find(params[:id])
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def change_status(party_id) 
     view_party = UserParty.find_by(user_id: @user.id, party_id: params[:party_id])
     view_party.status = "1"
     view_party.save  
    end  
end


