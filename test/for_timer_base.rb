# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative '../timer/pomodoro_executer'

# 1分で基底クラスをテスト
timer = TimerBase.new(time: 1)
timer.run
