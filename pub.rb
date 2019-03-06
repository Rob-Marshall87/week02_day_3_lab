class Pub
  attr_reader :name, :drinks, :foods
  def initialize(name, till, drinks, foods)
    @name = name
    @till = till
    @drinks = drinks
    @foods = foods
  end

  def how_much_in_till
    return @till
  end

  def remove_drink(drink)
    @drinks[drink.name].delete(drink)
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

  def remove_food(food)
    @foods.delete(food)
  end

  def sell_food(food)
    cost = food.price
    add_money_to_till(cost)
    remove_food(food)
    return food
  end

  def stock_take(drink_name)
    return @drinks[drink_name].length
  end

  def stock_value
    value = 0
    for shelf_name in @drinks.keys
      for drink in @drinks[shelf_name]
        value += drink.price

      end
    end
    return value
  end

end
