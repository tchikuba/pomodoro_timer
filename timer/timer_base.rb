# frozen_string_literal: true

# タイマーの基底クラス
class TimerBase
  def initialize(time:)
    @start_time = Time.now
    @end_time = @start_time + time * 60
  end

  def run
    while Time.now < @end_time
      sleep PomodoroExecuter::SLEEP_TIME
      diff = @end_time.to_i - Time.now.to_i
      minites = diff / 60
      print "\r#{minites}:#{format('%02d', diff - minites * 60)}"
    end
    puts
  end
end
