require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../pub")
require_relative("../drink")
require_relative("../food")

class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Rob", 100, 31)

    @drink1 = Drink.new("Beer", 4, 2)
    @drink2 = Drink.new("Wine", 5, 1)
    @drink3 = Drink.new("Cider", 3, 5)

    @drinks = [@drink1, @drink2, @drink3]

    @food1 = Food.new("Burger", 4, 2)
    @food2 = Food.new("Chips", 2, 1)

    @foods = [@food1, @food2]

    @pub1 = Pub.new("Chanter", 150, @drinks, @foods)

    @customer2 = Customer.new("Jock", 100, 31)
    @customer3 = Customer.new("John", 10, 13)





  end

  def test_customer_has_name
    assert_equal("Rob", @customer1.name)
  end

  def test_customer_has_wallet
    assert_equal(100, @customer1.how_much_money)
  end

  def test_remove_money_from_wallet
    @customer1.remove_money_from_wallet(50)
    assert_equal(50, @customer1.how_much_money)
  end

  def test_buy_drink_from_pub__under_age
    @customer1.buy_drink_from_pub(@pub1, @drink2)
    assert_equal(95, @customer1.how_much_money)
    assert_equal(1, @customer1.alcohol_level)
  end
  def test_buy_drink_from_pub__sober
    @customer1.buy_drink_from_pub(@pub1, @drink2)
    assert_equal(95, @customer1.how_much_money)
    assert_equal(1, @customer1.alcohol_level)
  end


# Extensions

  def test_customer_has_age
    assert_equal(31, @customer1.tell_age)
  end

  def test_customer_has_alcohol_level
    assert_equal(0, @customer1.alcohol_level)
  end

  def test_buy_drink_from_pub__drunk
    @customer2.buy_drink_from_pub(@pub1, @drink1)
    @customer2.buy_drink_from_pub(@pub1, @drink3)
    assert_equal(7, @customer2.alcohol_level)
    @customer2.buy_drink_from_pub(@pub1, @drink2)
    assert_equal(93, @customer2.how_much_money)
    assert_equal(7, @customer2.alcohol_level)
  end

  def test_buy_food_from_pub #using customer 2
    @customer2.buy_drink_from_pub(@pub1, @drink3)
    @customer2.buy_food_from_pub(@pub1, @food1)
    assert_equal(93,@customer2.how_much_money)
    assert_equal(3, @customer2.alcohol_level)
  end
end
