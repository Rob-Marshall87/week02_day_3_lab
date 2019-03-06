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

  def sell_drink(drink, customer)
    if customer.tell_age >= 18 && customer.alcohol_level < 7
      cost = drink.price
      add_money_to_till(cost)
      remove_drink(drink)
      return drink
    end
  end
end
