# frozen_string_literal: true

require_relative './timer_base'

# 休憩クラス
class Break < TimerBase
  def initialize(type:)
    time = case type
           when :long
             PomodoroExecuter::LONG_BREAK_TIME
           when :short
             PomodoroExecuter::SHORT_BREAK_TIME
           end
    super(time: time)
  end
end
