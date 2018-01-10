require_relative './station.rb'
require_relative './journey.rb'
require_relative './journeylog.rb'

class Oystercard

  CARD_LIMIT = 90
  MIN_BALANCE = 1

  attr_reader :balance, :history, :entry_station, :journey

  def initialize
    @balance = 0
    @journey = Journey.new
    @history = []
  end

  def top_up(money)
    raise("There cannot be more than #{CARD_LIMIT} on the card") if (@balance + money) > CARD_LIMIT
    @balance += money
  end


  def touch_in(station)
    raise("Insufficient funds") if @balance < MIN_BALANCE
    deduct(@journey.fare)
    @journey.start(station)
  end

  def touch_out(station)
    @journey.finish(station)
    @history << { entry_station: @journey.entry_station, exit_station: @journey.exit_station }
    deduct(@journey.fare)
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
