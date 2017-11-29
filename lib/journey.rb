
class Journey
  PENALTY_FARE = 6
  MINIMUM_FARE = 1
  attr_reader :entry_station, :exit_station

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
  end

  def started?
    @entry_station && !@exit_station 
  end

  def complete?
    !!(@entry_station && @exit_station)
  end

  def fare
    return PENALTY_FARE unless complete?
    MINIMUM_FARE
  end

end
