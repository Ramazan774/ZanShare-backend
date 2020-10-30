module Api::V1
    class UsersController < ApplicationController
        def index
            users = User.all
        end
        
        def show
            user = User.find(params[:id])
            render json: user
        end

        def create
            user = User.new(user_params)

            if user.save
                render json: user
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
            head :no_content
        end

        private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :age, :phone_number,  :email, :password_digest)
        end

    end
end
