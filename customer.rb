class Customer
  attr_reader :name
  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def how_much_money()
    return @wallet
  end

end
