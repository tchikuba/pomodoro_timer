# frozen_string_literal: true

# タイマーの基底クラス
class TimerBase
  def initialize(time:)
    @time = time
  end

  def run
    (@time - 1).downto(0) do |mi|
      59.downto(0) do |s|
        print "\r#{mi}:#{format('%02d', s)}"
        sleep PomodoroExecuter::SLEEP_TIME
      end
    end
    puts
  end
end
