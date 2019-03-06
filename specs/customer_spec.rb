require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")

class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Rob", 100)

  end

  def test_customer_has_name
    assert_equal("Rob", @customer1.name)
  end

  def test_customer_has_wallet
    assert_equal(100, @customer1.how_much_money)
  end
end
