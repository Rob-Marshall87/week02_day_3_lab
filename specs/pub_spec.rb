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

end
