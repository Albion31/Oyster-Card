

class Oystercard
  attr_reader :balance, :entry_station, :log
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
    @entry_station ? true : false
  end

  def touch_in (station)
    raise "Not enough money" if @balance < DEFAULT_MINIMUM
     @entry_station = station
  end

  def touch_out(station)
    @log << {entry_station: @entry_station, exit_station: station}
    @entry_station = nil
    deduct(DEFAULT_MINIMUM)

  end

  private

  def deduct(money)
    @balance -= money
  end
end
