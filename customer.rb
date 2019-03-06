class Customer
  attr_reader :name
  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def how_much_money()
    return @wallet
  end

  def remove_money_from_wallet(money)
    @wallet -= money
  end

  def buy_drink_from_pub(pub, drink)
    cost = pub.sell_drink(drink)
    remove_money_from_wallet(cost)
  end

end
