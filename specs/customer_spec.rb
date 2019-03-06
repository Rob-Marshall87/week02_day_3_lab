require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../pub")
require_relative("../drink")

class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Rob", 100)

    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Cider", 3)

    @drinks = [@drink1, @drink2, @drink3]

    @pub1 = Pub.new("Chanter", 150, @drinks)

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

  def test_buy_drink_from_pub
    @customer1.buy_drink_from_pub(@pub1, @drink2)
    assert_equal(95, @customer1.how_much_money)
  end


end
