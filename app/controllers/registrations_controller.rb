class RegistrationsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user_type = params[:user][:user_type]

        if user_type == 'Admin'
            @user = Admin.new(user_params)
        elsif user_type == 'Manager'
            @user = Manager.new(user_params)
        elsif user_type == 'Employee'
            @user = Employee.new(user_params)
        else
            @user = User.new(user_params)
        end

        if @user.save
            redirect_to root_path, notice: 'User registered successfully.'
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email,:user_type, :password_digest, :pasword_confirmation)
    end
end
