require 'jwt'

class UsersController < ApplicationController
    wrap_parameters :user, include: [:first_name, :last_name, :age, :email, :password, :phone_number]

    def index
        users = User.all
        render json: users
    end
    
    def show
        user = User.find(params[:id])
        render json: user
    end

    def login
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = JWT.encode(payload, 'S3cr3t', 'HS256')
            
            render json: {user: user, token: token}
        else
            render(json: {error: 'Invalid email or password'})
        end
    end

    def current_session
        token = request.headers[:Authorization].split(' ')[1]
        decoded_token = JWT.decode(token, 'S3cr3t', true, {algorithm: 'HS256'})
        user_id = decoded_token[0]['user_id']
        
        user = User.find(user_id)
        if user 
            render json: {id: user.id, user: user, token: token}
        else
            render json: {error: "Invalid token"}
        end
    end

    def create
        user = User.create(user_params)

        if user.valid?
            payload = {id: user.id}
            token = JWT.encode(payload, 'S3cr3t', 'HS256')
            render json: {user: user, token: token }
        else
            render json: {error: 'Email has been taken'}
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
        params.require(:user).permit(:first_name, :last_name, :age, :phone_number,  :email, :password)
    end

end

