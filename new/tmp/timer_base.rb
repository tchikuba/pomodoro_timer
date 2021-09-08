class TimerBase
  def initialize(minutes:)
    @start_time = Time.now
    @end_time = @start_time + minutes * 60
  end

  def run
    while Time.now < @end_time
      sleep 1
      diff = @end_time.to_i - Time.now.to_i
      minites = diff / 60
      print "\r#{minites}:#{format('%02d', diff - minites * 60)}"
    end
    puts
  end
end
