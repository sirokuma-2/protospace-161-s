class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show]

  def index
    @prototypes = Prototype.all
    # @prototypes = Prototype.includes(:user)
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

  def show
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
    render :edit, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    # @prototype = Prototype.find(params[:id])
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end