class StocksController < ApplicationController
  before_action :require_login

  def index
    @stocks = current_user.stocks.includes(:vegetable)
                          .where(status: :active)
                          .sort_by { |s| -s.elapsed_days.to_f / s.vegetable.shelf_life_days }
  end

  def new
    @vegetables = Vegetable.order(:name)
    @stock = Stock.new
  end

  def create
    if params[:stock][:vegetable_id].blank?
      @vegetables = Vegetable.order(:name)
      @stock = Stock.new
      flash.now[:alert] = "野菜を選択してください"
      render :new, status: :unprocessable_entity
      return
    end

    @stock = current_user.stocks.build(stock_params)
    @stock.purchased_on = params[:stock][:purchased_on].present? ? params[:stock][:purchased_on] : Date.today
    @stock.status = :active
    if @stock.save
      redirect_to stocks_path, notice: "野菜を登録しました！"
    else
      @vegetables = Vegetable.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @stock = current_user.stocks.find(params[:id])
    @stock.update(status: :eaten)
    redirect_to stocks_path, notice: "食べきりました！食品ロス削減に貢献しました！"
  end

  private

  def stock_params
    params.require(:stock).permit(:vegetable_id, :purchased_on)
  end
end