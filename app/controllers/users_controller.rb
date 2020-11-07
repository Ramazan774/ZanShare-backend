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

    def create
        user = User.new(user_params)

        if user.save
            payload = {id: user.id}
            token = JWT.encode(payload, 'S3cr3t', 'HS256')
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
        params.require(:user).permit(:first_name, :last_name, :age, :phone_number,  :email, :password)
    end

end

