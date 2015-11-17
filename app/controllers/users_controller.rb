class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_parameters)

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find_by_id(params[:id])
  end

  def update
    user = User.find_by_id(params[:id])
    if user.update(user_parameters)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by_id(params[:id])

    if user.destroy
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

private
  def user_parameters
    params.require(:user).permit(:username)
  end

end
