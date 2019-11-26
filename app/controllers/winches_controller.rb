class WinchesController < ApplicationController
  before_action :set_winch, only: [:show, :edit]
  def index
    @winches = current_user.winches
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

  def edit
  end

  # def update
  #   if @winch.update(winch_params)
  #     redirect_to winch_path

  # end

  private

  def winch_params
    params.require(:winch).permit(
      :brand,
      :winch_type,
      :plate
    )
  end

  # def set_winch
  #   @winch = current_user.winches.find(params[:id])
  # end
end
