class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  # before_action :authenicate_user, only: [:show]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

# Auth user
  
# Register Users 
  def register
    @user = User.new(user_params)
    # print(@user)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # Need check password for login
  def login 
    @user = User.find_by(username: params[:username])
    puts request
    if @user
      if @user.authenticate(params[:password_digest])
        token = encode_token(user_id: @user.id)
        cookies.signed[:jwt] = {value:  token, httponly: true, expires: 1.hour.from_now,  same_site: :none}
        render json: {user:@user, login:true, token:token}
      else
        render json: {message: "Wrong Password", login:false}
      end
    else 
      render json: {message: "Wrong Username", login:false}
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  def logout
    cookies.delete(:jwt)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :password, :email, :aboutyou, :pfp, :password_confirmation, :password_digest)
    end
end
