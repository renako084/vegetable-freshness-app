def create
  if params[:vegetable_name].blank?
    flash.now[:alert] = "野菜名を入力してください"
    @stock = Stock.new
    render :new, status: :unprocessable_entity
    return
  end

  vegetable = Vegetable.find_or_create_by(name: params[:vegetable_name]) do |v|
    v.shelf_life_days = 5
  end

  purchased_on = params[:purchased_on].present? ? params[:purchased_on] : Date.today

  @stock = current_user.stocks.build(
    vegetable: vegetable,
    purchased_on: purchased_on,
    status: :active
  )

  if @stock.save
    redirect_to stocks_path, notice: "野菜を登録しました！"
  else
    render :new, status: :unprocessable_entity
  end
end