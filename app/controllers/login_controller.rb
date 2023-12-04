class LoginController < ApplicationController

    def login

    end

    def loginPost
        @email = params[:email]
        @user = Admin.find_by(email: @email) || Manager.find_by(email: @email) || Employee.find_by(email: @email)

        password = params[:password]

        if @user&.authenticate(password)
            payload = {email: @user.email}
            puts "payload = #{payload}"
            token = JsonWebToken.encode(payload)
            puts "token = #{token}"
            session[:user_token] = token
            puts "session token = #{session[:user_token]}"
            redirect_to dashboard_path
        else
            puts "Validation error: #{@user.errors.full_messages}"
            flash[:alert] = @user.errors.full_messages
            return
        end
    end

    def dashboard
    end

    def current_user
        token = session[:user_token]
        if token.present?
            user_info = JsonWebToken.decode(token)
            user_id = user_info[:email]
            if user_id
                @current_user = User.find_by(email: user_id)
            else
                @current_user = nil
            end
        else
            @current_user = nil
        end
        @current_user
    end

    
end