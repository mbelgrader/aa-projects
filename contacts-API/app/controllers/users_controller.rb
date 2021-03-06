class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find_by(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: 'Update unsuccessful'
    end
  end

  def destroy
    user = User.find_by(params[:id])

    if user.destroy
      render json: user
    else
      render json: "Destroy unsuccessful"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
