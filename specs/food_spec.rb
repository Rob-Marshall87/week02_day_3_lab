require("minitest/autorun")
require("minitest/rg")
require_relative("../food")

class TestFood < MiniTest::Test

  def setup
    @food1 = Food.new("Burger", 4, 2)
  end

  def test_food_has_name
    assert_equal("Burger", @food1.name)
  end

  def test_food_has_price
    assert_equal(4, @food1.price)
  end

  def test_food_has_rejuvenation_level
    assert_equal(2, @food1.how_filling)
  end

end
