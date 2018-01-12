class Journeylog
  attr_reader :journey

  def initialize
    @journey = nil
  end

  def start(station)
    @journey = Journey.new
    @journey.start(station)
  end

end
