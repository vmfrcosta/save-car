class GuinchosController < ApplicationController
  def index
    if params[:brand].present?
      @guinchos = Guincho.where(brand: params[:brand]).order(:model)
    else
      @guinchos = Guincho.all.order(:model)
    end
  end
end
