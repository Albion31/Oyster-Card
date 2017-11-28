require_relative 'journey'

class Oystercard
  attr_reader :balance, :log
  DEFAULT_MINIMUM = 1
  DEFAULT_LIMIT = 90

  def initialize
    @balance = 0
    @log = []
  end

  def top_up(money)
    raise "You have reached a top up limit of £#{DEFAULT_LIMIT}" if  money + @balance > DEFAULT_LIMIT
    @balance += money
  end

  def in_journey?
    if @journey == nil
      return false
    end
    @journey.complete? == false
  end

  def touch_in (station, journey = Journey.new)
    raise "Not enough money" if @balance < DEFAULT_MINIMUM
    @journey = journey
    @journey.start(station)
     # @entry_station = station
  end

  def touch_out(station)
    @journey.end(station)
    @log << @journey
    @journey = nil
    # @log << {entry_station: @entry_station, exit_station: station}
    # @entry_station = nil
    deduct(DEFAULT_MINIMUM)
  end

  def entry_station
    if @journey == nil
      return nil
    end
    @journey.entry_station
  end

  private

  def deduct(money)
    @balance -= money
  end
end
