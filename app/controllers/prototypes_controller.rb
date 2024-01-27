class PrototypesController < ApplicationController
  def index
    # @prototype = Prototype.new
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

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

 end