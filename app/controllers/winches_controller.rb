class WinchesController < ApplicationController
  before_action :set_winch, only: %i[show edit update destroy]
  def index
    @winches = current_user.winches
  end

  def show
  end

  def new
    @winch = Winch.new
    guinchos = Guincho.all
    @brands = guinchos.map(&:brand).uniq
    @models = guinchos.map(&:model).uniq
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
    @winch.update(winch_params)
    if @winch.update(winch_params)
      redirect_to winch_path
    else
      render :edit
    end
  end

  def destroy
    @winch.visible = false
    @winch.save
    redirect_to winches_path
  end

  private

  def winch_params
    params.require(:winch).permit(
      :brand,
      :plate,
      :model
    )
  end

  def set_winch
    @winch = Winch.find(params[:id])
  end
end
