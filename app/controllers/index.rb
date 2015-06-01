enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

#nak user sign up dulu
get "/users/sign_up" do
 @user = User.new
 erb :user
end

post "/users" do
	@user = User.new(params[:user])
	@user.save
	redirect to("/login")
end

get '/login' do
	erb :login
end

post "/login" do
	  @user = User.authenticate(params["user"]["email"], params["user"]["password"])
  # byebug
  if @user
    session[:id] = @user.id

    redirect to "/my_page/#{@user.id}"
  else
    redirect to("/login")
  end
end

get "/my_page/:id" do
	@user = User.find(params[:id])
	@statuses = @user.statuses
	#@status = Status.new
	erb :my_page
end

# untuk tulis status, which is any news
# post "/status/:id" do
# @status = Status.new(params[:status])
# @status.save
# @user = User.find(params[:id])
# @status = Status.all
# erb :my_page
# end


get "/status/:id/edit" do

  @user = User.find(params[:id])
  # @post_tags = Profile.where(user_id: @user.id)
  # @tags = []
  # @post_tags.each do |post_tag|
  #   @tags << post_tag.tag.name
  # end
  # @tag_string = @tags.join(", ")
  erb :edit
end

put "/users/:id" do
	@user = User.find(params[:id])
	@user.update(params[:user])
	if @user.save
		redirect to ("/my_page/#{@user.id}")
	else
		erb :edit
	end
end


get "/status/:id/put_status" do
 @status = Status.new
 erb :status
end


post "/display_status/new" do
 @status = Status.new(params[:status])
 @status.save	
 redirect to "/display/#{@status.id}"
end

get '/display/:id' do
	@status = Status.find(params[:id])
	erb :display
end



# get "/users/:id/login" do

# 	erb :login
# 	end


# get "/users/:id/login" do
# 	@user = User.authenticate(params["user"]["email"], params["user"]["password"])
# 	if @user
# 		session[:id] = @user.id
# 		redirect to "/my_page"
# 	else

# 	erb :login
# end