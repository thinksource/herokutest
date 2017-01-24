class SessionsController < ApplicationController

  def new
    #redirect_to '/auth/facebook'
  end

  def redirects
    user = User.find_by(email: params[:session][:email].downcase, provider: params[:session][:email], business: params[:session][:buiness])
    if params[:session][:provider]=="facebook"
      redirect_to '/auth/facebook?business='+params[:session][:business]
    elsif params[:session][:provider]=="google"
      redirect_to '/auth/google?business='+params[:session][:business]

    else user && user.authenticate(params[:session][:password])

    end
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
