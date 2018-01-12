class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def start(station = nil)
    @entry_station = station
  end

  def finish(station = nil)
    @exit_station = station
  end

  private
  def complete?
    !@exit_station.nil? && !@entry_station.nil?
  end

end
