class AuthController < ApplicationController

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

    def logout
        session.destroy()
    end
    
end
