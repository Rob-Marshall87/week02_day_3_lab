class Customer
  attr_reader :name
  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @alcohol_level = 0
  end

  def how_much_money()
    return @wallet
  end

  def remove_money_from_wallet(money)
    @wallet -= money
  end

  def buy_drink_from_pub(pub, drink)
    drink = pub.sell_drink(drink, self)
    if drink != nil
      cost = drink.price
      remove_money_from_wallet(cost)
      units = drink.units
      @alcohol_level += units
    end
  end

  def tell_age
    return @age
  end

  def alcohol_level
    return @alcohol_level
  end

  def buy_food_from_pub(pub,food)
    food = pub.sell_food(food)
    cost = food.price
    remove_money_from_wallet(cost)
    rejuvenation = food.how_filling
    @alcohol_level -= rejuvenation
  end

end
