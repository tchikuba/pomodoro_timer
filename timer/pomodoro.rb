# frozen_string_literal: true

require_relative './timer_base'

# ポモドーロクラス
class Pomodoro < TimerBase
  def initialize(time: PomodoroExecuter::POMODORO_TIME)
    super
  end
end
