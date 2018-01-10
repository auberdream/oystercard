class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    return MIN_FARE if (started? && complete?)
    return PENALTY_FARE if (started? && !complete?)
    0
  end

  def start(station = nil)
    @entry_station = station
  end

  def finish(station = nil)
    @exit_station = station
  end

  private
  def complete?
    ((@entry_station != nil) && (@exit_station != nil))
  end

  def started?
    @entry_station != nil
  end

end
