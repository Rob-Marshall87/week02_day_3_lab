require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")
require_relative("../food")

class TestPub < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4, 2)
    @drink4 = Drink.new("Beer", 4, 2)
    @drink2 = Drink.new("Wine", 5, 1)
    @drink3 = Drink.new("Cider", 3, 5)

    @drinks = {
      "Beer" => [@drink1, @drink4], "Wine" => [@drink2], "Cider" => [@drink3]
    }

    @food1 = Food.new("Burger", 4, 2)
    @food2 = Food.new("Chips", 2, 1)

    @foods = [@food1, @food2]

    @pub1 = Pub.new("Chanter", 150, @drinks, @foods)


    @customer1 = Customer.new("Rob", 100, 31)
    @customer2 = Customer.new("Jock", 100, 31)
    @customer3 = Customer.new("John", 10, 13)

  end

  def test_pub_has_name
    assert_equal("Chanter", @pub1.name)
  end

  def test_pub_has_till
    assert_equal(150, @pub1.how_much_in_till)
  end

  def test_pub_has_drinks
    assert_equal(@drinks, @pub1.drinks)
  end

  def test_remove_drink
    @pub1.remove_drink(@drink1)
    assert_equal(1, @pub1.drinks[@drink1.name].length)
  end

  def test_add_money_to_till
    @pub1.add_money_to_till(10)
    assert_equal(160, @pub1.how_much_in_till)
  end

  def test_sell_drink__customer_over_18
    result = @pub1.sell_drink(@drink1, @customer1)
    assert_equal(1, @pub1.drinks[@drink1.name].length)
    assert_equal(154, @pub1.how_much_in_till)
    assert_equal(@drink1, result)
  end

  def test_sell_drink__customer_under_18
    result = @pub1.sell_drink(@drink1, @customer3)
    assert_equal(2, @pub1.drinks[@drink1.name].length)
    assert_equal(150, @pub1.how_much_in_till)
    assert_nil(result)
  end

  def test_sell_drink__customer_drunk
    @customer2.buy_drink_from_pub(@pub1, @drink1)
    @customer2.buy_drink_from_pub(@pub1, @drink3)
    assert_equal(7, @customer2.alcohol_level)
    result = @pub1.sell_drink(@drink2, @customer2)
    assert_equal(1, @pub1.drinks[@drink2.name].length)
    assert_equal(157, @pub1.how_much_in_till)
    assert_nil(result)
  end

  #Advanced Extensions

  def test_has_food
    assert_equal(@foods, @pub1.foods)
  end

  def test_remove_food
    @pub1.remove_food(@food1)
    assert_equal(1, @pub1.foods.length)
  end

  def test_sell_food
    assert_equal(2, @pub1.foods.length)
    assert_equal(150, @pub1.how_much_in_till)
    @pub1.sell_food(@food1)
    assert_equal(1, @pub1.foods.length)
    assert_equal(154, @pub1.how_much_in_till)
  end

  def test_stock_take
    result = @pub1.stock_take("Beer")
    assert_equal(2, result)
  end

  def test_stock_value
    assert_equal(16, @pub1.stock_value)
  end

end
