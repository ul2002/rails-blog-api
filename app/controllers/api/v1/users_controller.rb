class Api::V1::UsersController < ApplicationController
    skip_before_action :authenticate_request , only: [:register, :login]
    # GET /users
    def index
      # authorize!(:read)
      @users = User.all
      render json: @users
    end
    # POST /users
    def register
        @user = User.create!(user_params)
        if @user.save
          render(json: { message: "User created successfully" }, status: :created)
        else
          render(json: @user.errors, status: :bad)
        end
    end
    # POST /login
    def login
        command = AuthenticateUser.call(params[:username], params[:password])
    
        if command.successful?
          render(json: { auth_token: command.result })
        else
          render(json: { error: command.errors }, status: :unauthorized)
        end
    end

    def user_params
        params.permit(:username, :password)
    end
end
