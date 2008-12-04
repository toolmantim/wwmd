module Enumerable
  def random
    self[((self.length * rand).ceil * 100) - 1]
  end
end
