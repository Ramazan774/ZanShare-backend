require 'jwt'

class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end
    
    def show
        user = User.find(params[:id])
        render json: user
    end

    def login
        user = User.find_by({email: params[:email]})

        if(user && user.authenticate(params[:password]))
            payload = {user_id: user.id}
            token = JWT.encode(payload, 'SecretK3y', 'HS256')
            render json: {current_user}
        else
            render(json: {error: 'Invalid email or password'})
        end
    end

    def get_session_user
        token = request.headers[:Authorization].split(' ')[1]
        decoded_token = JWT.decode(token, 'SecretK3y', true, {algorithm: 'HS256'})
        user_id = decoded_token[0]['user_id']
        
        render json: {current_user}
    end

    def create
        user = User.new(user_params)

        if user.save
            payload = {id: user.id}
            token = JWT.encode(payload, 'SecretK3y', 'HS256')
            render json: {id: user.id, email: user.email, token: token }
        else
            render json: {error: 'Username has been taken'}
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {message: 'Successfully deleted'}
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :age, :phone_number,  :email, :password_digest)
    end

end

