class AutosController < ApplicationController
  def index
    if params[:brand].present?
      @autos = Auto.where(brand: params[:brand]).order(:model)
    else
      @autos = Auto.all.order(:model)
    end
  end
end
