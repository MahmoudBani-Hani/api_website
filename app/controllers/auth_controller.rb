class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base)

      render json: {
        user: user,
        token: token
      }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def register
    user = User.new(user_params)
    if user.save
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
      render json: { token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def logout
    # For JWT, logout can be handled on the client side by simply deleting the token.
    # Optionally, you can implement token blacklisting on the server side if needed.
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
