class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path(@prototype)
    else
      @prototypes = Prototype.includes(:user)
      render :new
    end
  end

  def edit
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in?
      @prototype.destroy
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    return if user_signed_in? && current_user.id == Prototype.find(params[:id]).user_id

    redirect_to action: :index
  end
end
