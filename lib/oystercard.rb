require_relative 'journey'

class Oystercard
  attr_reader :balance, :log
  DEFAULT_MINIMUM = 1
  DEFAULT_LIMIT = 90

  def initialize
    @balance = 0
    @log = []
    @journey = Journey.new
  end

  def top_up(money)
    raise "You have reached a top up limit of £#{DEFAULT_LIMIT}" if  money + @balance > DEFAULT_LIMIT
    @balance += money
  end

  def in_journey?
   
    @journey.started? && !@journey.complete?
  end

  def touch_in (station, journey = @journey)
    raise "Not enough money" if @balance < DEFAULT_MINIMUM
    deduct(@journey.fare) if @journey.started?
    @journey = journey
    @journey.start(station)
     # @entry_station = station
  end

  def touch_out(station)
    @journey.end(station)
    @log << @journey
    deduct(@journey.fare)
    @journey = Journey.new
    # @log << {entry_station: @entry_station, exit_station: station}
    # @entry_station = nil
   
  end

  def entry_station
    @journey.entry_station
  end

  private

  def deduct(money)
    @balance -= money
  end
end
