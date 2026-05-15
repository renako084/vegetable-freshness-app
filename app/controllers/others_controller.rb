class OthersController < ApplicationController
  before_action :require_login

  def new
    @stock = Stock.new
  end

  def create
    vegetable = Vegetable.find_or_create_by(name: params[:vegetable_name]) do |v|
      v.shelf_life_days = 5
    end

    @stock = current_user.stocks.build(
      vegetable: vegetable,
      purchased_on: Date.today,
      status: :active
    )

    if @stock.save
      redirect_to stocks_path, notice: "野菜を登録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end
end