# frozen_string_literal: true

require './break'

class LongBreak < Break
  def initialize
    super(type: :long)
  end
end
