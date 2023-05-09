class ApplicationController < ActionController::API
include ActionController::Cookies

def authorize
    puts "Authorization request failed"
    render json: {errors: "Please login first"}, status: :unauthorized unless session.include? :user_id
end
end
