require_relative './station.rb'

class Oystercard

  CARD_LIMIT = 90
  MIN_BALANCE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(money)
    raise("There cannot be more than #{CARD_LIMIT} on the card") if (@balance + money) > CARD_LIMIT
    @balance += money
  end


  def touch_in(station)
    raise("Insufficient funds") if @balance < MIN_BALANCE
    @entry_station = station
    @in_journey = true
    in_journey?
  end

  def touch_out
    deduct
    @entry_station = nil
    @in_journey = false
    in_journey?
  end

  def in_journey?
    (@entry_station == nil) ? "Out" : "In"
  end

  private
  def deduct
    @balance -= 1
  end

end
