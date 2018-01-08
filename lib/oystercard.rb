class Oystercard

  CARD_LIMIT = 90

  attr_reader :balance

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(money)
    raise("There cannot be more than #{CARD_LIMIT} on the card") if (@balance + money) > CARD_LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    @in_journey = true
    in_journey?
  end

  def touch_out
    @in_journey = false
    in_journey?
  end

  # private

  def in_journey?
    @in_journey ? "in use" : "not in use"
  end

end
