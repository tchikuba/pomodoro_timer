# frozen_string_literal: true

require_relative './pomodoro'
require_relative './break'

class PomodoroExecuter
  POMODORO_TIME = 25
  SHORT_BREAK_TIME = 5
  LONG_BREAK_TIME = 15
  SLEEP_TIME = ENV['DEBUG'].nil? ? 1 : 0.001

  def self.call
    pomodoro_count = 0
    short_break_count = 0
    long_break_count = 0

    loop do
      4.times do |i|
        pomodoro_count += 1
        puts "ポモドーロ#{pomodoro_count}回目スタート"
        Pomodoro.new.run
        puts "ポモドーロ#{pomodoro_count}回目終了（#{POMODORO_TIME * pomodoro_count}分経過）"

        short_break_count += 1
        puts "ショートブレイク#{short_break_count}回目スタート"
        Break.new(type: :short).run
        puts "ショートブレイク#{short_break_count}回目終了（#{SHORT_BREAK_TIME * short_break_count}分経過）"

        i += 1
        puts "ポモドーロセット#{(POMODORO_TIME + SHORT_BREAK_TIME) * i}分経過"
      end

      long_break_count += 1
      puts "ロングブレイク#{long_break_count}回目スタート"
      Break.new(type: :long).run
      puts "ロングブレイク#{long_break_count}回目終了（#{LONG_BREAK_TIME * long_break_count}分経過）"

      k = 0
      k += 1
      puts "4ポモドーロセット#{((POMODORO_TIME + SHORT_BREAK_TIME) * 4 + LONG_BREAK_TIME) * k}分経過"
    end
  end
end
