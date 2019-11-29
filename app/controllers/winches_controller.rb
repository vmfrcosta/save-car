class WinchesController < ApplicationController
  before_action :set_winch, only: [:show, :edit]
  def index
    @winches = Winch.all
  end

  def show
  end

  def new
    @winch = Winch.new
  end

  def create
    @winch = Winch.new(winch_params)
    @winch.user = current_user
    if @winch.save
      redirect_to winches_path
    else
      render :new
    end
  end

  private

  def winch_params
    params.require(:winch).permit(
      :brand,
      :winch_type,
      :plate
    )
  end

  def set_winch
    @winch = current_user.winches.find(params[:id])
  end
end
