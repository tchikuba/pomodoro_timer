# frozen_string_literal: true

require_relative './pomodoro'
require_relative './break'

# ポモドーロサイクル実行クラス
class PomodoroExecuter
  POMODORO_TIME = 25
  SHORT_BREAK_TIME = 5
  LONG_BREAK_TIME = 15
  SLEEP_TIME = 1

  def initialize
    @pomodoro_count = 0
    @short_break_count = 0
    @long_break_count = 0
  end

  def call
    loop do
      pomodoro_cycle_with_logs
      long_break_with_logs
      k = 0
      k += 1
      puts "4ポモドーロセット#{((POMODORO_TIME + SHORT_BREAK_TIME) * 4 + LONG_BREAK_TIME) * k}分経過"
    end
  end

  private

  def pomodoro_cycle_with_logs
    4.times do |i|
      pomodoro_with_logs
      short_break_with_logs
      i += 1
      puts "ポモドーロセット#{(POMODORO_TIME + SHORT_BREAK_TIME) * i}分経過"
    end
  end

  def pomodoro_with_logs
    @pomodoro_count += 1
    puts "ポモドーロ#{@pomodoro_count}回目スタート"
    Pomodoro.new.run
    puts "ポモドーロ#{@pomodoro_count}回目終了（#{POMODORO_TIME * @pomodoro_count}分経過）"
  end

  def short_break_with_logs
    @short_break_count += 1
    puts "ショートブレイク#{@short_break_count}回目スタート"
    Break.new(type: :short).run
    puts "ショートブレイク#{@short_break_count}回目終了（#{SHORT_BREAK_TIME * @short_break_count}分経過）"
  end

  def long_break_with_logs
    @long_break_count += 1
    puts "ロングブレイク#{@long_break_count}回目スタート"
    Break.new(type: :long).run
    puts "ロングブレイク#{@long_break_count}回目終了（#{LONG_BREAK_TIME * @long_break_count}分経過）"
  end
end
