class ReviewsController < ApplicationController
  before_action :set_winch
  before_action :set_user

  def create
    @review = Review.new(review_params)
    @review.user = @user
    @review.winch = @winch
    @review.visible = true
    if @review.save
      redirect_to winch_path(@winch)
    else
      render 'winches/show'
    end
  end

  def destroy
    @review = Review.find(:id)
    if @review.user == current_user
      @review.visible = false
      redirect_to winch_path(@winch)
    else
      redirect_to winch_path(@winch)
      flash[:alert] = "Não é permitido deletar a avaliação de outro usuário"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_winch
    @winch = Winch.params[:winch_id]
  end

  def set_user
    @user = current_user
  end
end
