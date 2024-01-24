class PrototypesController < ApplicationController
  def index
  end
end

  private

  def prototype_params
    params.require(:prototype).permit(:content, :image).merge(user_id: current_user.id)
  end