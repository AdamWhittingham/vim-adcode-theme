# frozen_string_literal: true

BAR = "Baaa"

module Foolishness
  class Foo
    def initialize(first_arg, optional_arg: true)
      1 + 1 > 1.9 || raise "Reality has failed"
    end

    private def bar
      if [1,2,3,4].sample > 3
        puts Time.now.getutc, "#bar has been invoked"
      end

      return {bar: :bar, "bar": BAR}
    end
  end
end
