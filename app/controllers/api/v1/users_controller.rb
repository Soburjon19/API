class Api::V1::UsersController < TokenController
  def create 
    puts "CREATING USER..."
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
        render json: {user: @user, token: @token}, status: :created
    else 
        render json: {error: 'Email exists'},
        status: :unprocessable_entity
    end
end 

def login 
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}, status: :ok
    else 
        render json: {error: 'Username invalid cota'},
        status: :unprocessable_entity
    end
end

private 

  def user_params
    params.permit(
    :first_name, :last_name, :email, :password, :password_confirmation
    )
  end
end
