class PartiesController <ApplicationController
  def new
    @user =  User.find(params[:user_id])
    @users = User.all
    @movie = MovieFacade.movie_show(params[:movie_id])
  end

  def create
    @movie = MovieFacade.movie_show(params[:movie_id])

    host = User.find(params[:user_id])
    
    params[:users] << params[:user_id]
    
    if params[:duration].to_i < @movie.runtime
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/parties/new"
      flash.alert = "Error! if the party ends before the movie no one will love you."
    elsif params[:users].count < 1
      
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/parties/new"
      flash.alert = "You'll die alone if you don't invite someone."
    else
      
    partytime = Party.create!(movie_id: params[:movie_id], date: params[:date], start: params[:start], 
                             duration: params[:duration], user_id: params[:user_id], movie_title: @movie.title, 
                             movie_image: @movie.image)

      if partytime.save
        params[:users].each do |user|
          UserParty.create!(user_id: user, party_id: partytime.id)
        end
          redirect_to "/users/#{params[:user_id]}?party_id=#{partytime.id}"
      else
          redirect_to "/users/#{user_id.id}/movies/#{movie_id.id}/parties/new"
          flash[:alert] = "Error: #{error_message(userparty.errors)}"
      end
    end
  end
end
