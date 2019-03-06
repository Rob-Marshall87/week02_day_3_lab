require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")

class TestPub < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Cider", 3)

    @drinks = [@drink1, @drink2, @drink3]

    @pub1 = Pub.new("Chanter", 150, @drinks)

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
    assert_equal(2, @pub1.drinks.length)
  end

  def test_add_money_to_till
    @pub1.add_money_to_till(10)
    assert_equal(160, @pub1.how_much_in_till)
  end

  def test_sell_drink
    result = @pub1.sell_drink(@drink1)
    assert_equal(2, @pub1.drinks.length)
    assert_equal(154, @pub1.how_much_in_till)
    assert_equal(4, result)
  end

end
