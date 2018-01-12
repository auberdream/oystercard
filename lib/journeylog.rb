class Journeylog
  attr_reader :journey_class

  def initialize(journey_class: )
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @current_journey = current_journey(station)
  end

  def finish(station)
    @current_journey.finish(exit_station: station)
  end

  private

  def current_journey(station)
    return journey_class.new(entry_station: station) if @current_journey.nil?
    return @current_journey if (current_journey.entry_station.nil? || current_journey.exit_station.nil?)
  end

end
