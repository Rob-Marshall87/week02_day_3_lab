require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class TestDrink < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 4)

  end

  def test_drink_has_name
    assert_equal("Beer", @drink1.name)
  end

  def test_drink_has_price
    assert_equal(4, @drink1.price)
  end

end
