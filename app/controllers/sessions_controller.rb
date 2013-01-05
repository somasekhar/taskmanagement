class SessionsController < ApplicationController
  def new
  end

  def create

    auth_hash = request.env['omniauth.auth']
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      sign_in(@user)
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)
      #render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
      #flash[:notice] = "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)

      # auth.user.skip_confirmation!
      sign_in(auth.user)
      # Create the session
      session[:user_id] = auth.user.id
    end
    redirect_to tasks_url
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

=begin
  def destroy
    Authorization[:user_id] = nil
    render :text => "You've logged out!"
  end
=end

end
