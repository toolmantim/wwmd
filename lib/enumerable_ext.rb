module Enumerable
  def random
    self[Kernel.rand(self.length)]
  end
end
