class User::CarsController < ApplicationController
  before_action :set_winch, only: [:show, :edit, :update, :destroy]
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

  def update
    if @winch.update(winch_params)
      redirect_to winch_winch_path(@winch)
    else
      render :new
    end
  end

  def destroy
    @winch.destroy
    redirect_to winch_winches_path
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