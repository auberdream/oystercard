require_relative './station.rb'
class Oystercard

  CARD_LIMIT = 90
  MIN_BALANCE = 1

  attr_reader :balance, :entry_station, :exit_station, :history

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @history = []
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

  def touch_out(station)
    deduct(MIN_BALANCE)
    @exit_station = station
    store_history
    @entry_station = nil
    @in_journey = false
    in_journey?
  end

  def in_journey?
    (@entry_station == nil) ? "Out" : "In"
  end

  private
  def deduct(charge)
    @balance -= charge
  end

  def store_history
    @history << [@entry_station, @exit_station]
  end

end
