get '/' do
  erb :index
end

post '/search' do
	username = params[:user]
	password = params[:password]
	@user = Octokit::Client.new(:login => username, :password => password)
  
  @login = @user.login
  @followers = @user.followers(username)
  @following = @user.following(username)
  @gists = @user.gists(username)

	erb :show_users
end