class Pub
  attr_reader :name, :drinks
  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def how_much_in_till
    return @till
  end

  def remove_drink(drink)
    @drinks.delete(drink)
  end

  def add_money_to_till(money)
    @till += money
  end

  def sell_drink(drink)
    cost = drink.price
    add_money_to_till(cost)
    remove_drink(drink)
    return cost
  end
end
