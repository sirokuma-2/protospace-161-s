class PrototypesController < ApplicationController
  def index
    @prototype = Prototype.new
  end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    redirect_to root_path
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept )
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end