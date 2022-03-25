class UsersController < ApplicationController

  def new
  end

  def create
    user = User.create(user_params)

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
      params.permit(:name, :email)
    end

    def change_status(party_id) 
     view_party = UserParty.find_by(user_id: @user.id, party_id: params[:party_id])
     view_party.status = "1"
     view_party.save  
    end  
end


