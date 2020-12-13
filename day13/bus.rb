module Day13
  class Bus
    attr_reader :route, :offset

    def initialize(route, offset)
      @route = route.to_i
      @offset = offset
    end

    def nextArrival(time)
      route - (time % route)
    end
  end
end
