class WinchesController < ApplicationController
  before_action :set_winch, only: %i[show edit update destroy]
  before_action :check_owner, only: %i[show edit update destroy]

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
      redirect_to user_winches_path(current_user)
    else
      render :new
    end
  end

  def edit
    guinchos = Guincho.all
    @brands = guinchos.map(&:brand).uniq
    @models = guinchos.map(&:model).uniq
  end

  def update
    if @winch.update(winch_params)
      redirect_to user_winch_path(current_user, @winch)
    else
      render :new
    end
  end

  def destroy
    @winch.visible = false
    @winch.save
    redirect_to user_winches_path(current_user)
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

  def check_admin
    unless current_user.admin
      redirect_to root_path
    end
  end

  def check_owner
    unless current_user == User.find(params[:user_id])
      redirect_to root_path
    end
  end
end
