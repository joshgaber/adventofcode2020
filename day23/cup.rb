module Day23
  class Cup
    attr_reader :id
    attr_accessor :next

    def initialize(id)
      @id = id
    end
  end
end
