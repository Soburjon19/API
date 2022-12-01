class Api::V1::AuthController < TokenController
    def login 
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :accepted
        else 
            render json: {error: 'Username invalid cota'},
            status: :unauthorized
        end
    end
    
    private 
    
      def user_params
        params.permit(:email, :password)
      end
end
