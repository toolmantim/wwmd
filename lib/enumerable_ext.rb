module Enumerable
  def random
    self[rand(self.length)]
  end
end
