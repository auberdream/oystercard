class Oystercard

  CARD_LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise("There cannot be more than #{CARD_LIMIT} on the card") if (@balance + money) > CARD_LIMIT
    @balance += money
  end

end
