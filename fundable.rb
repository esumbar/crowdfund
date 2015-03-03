module Fundable
  
  def add_funds(more_funds=25)
    self.funding += more_funds
    puts "Project #{self.name} got more funds!"
  end

  def remove_funds(less_funds=15)
    self.funding -= less_funds
    puts "Project #{self.name} lost some funds!"
  end

  def fully_funded?
    self.funding_shortfall <= 0
  end

end
