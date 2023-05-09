class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id, status: :created
            render json: user
        else
            render json: {errors: "Incorrect username or password"}, status: :unprocessable_entity
    end

    def destroy
        session.delete :user_id
        render json: {message: "Logout Successful"}, status: :ok
    end
end
