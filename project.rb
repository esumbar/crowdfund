class Project
  
  attr_accessor :name
  attr_reader :funding, :target

  def initialize(name, target, funding=0)
    @name = name.upcase
    @funding = funding
    @target = target
    @pledges = Hash.new(0)
  end

  def name=(new_name)
    @name = new_name.upcase
  end
  
  def total_pledges
    @pledges.values.reduce(0, :+)
  end

  def total_funding
    @funding + self.total_pledges
  end

  def received_pledge(pledge)
    @pledges[pledge.name] += pledge.amount    
    puts "Project #{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "Project #{@name}'s pledges: #{@pledges}"
  end

  def funding_shortfall
    @target - self.total_funding
  end

  def fully_funded?
    funding_shortfall <= 0
  end

  def <=>(other)
    other.funding_shortfall <=> self.funding_shortfall
  end

  def to_s
    "Project #{@name} has $#{@funding} in funding towards a goal of $#{@target}."
  end

  def add_funds(more_funds=25)
    @funding += more_funds
    puts "Project #{@name} got more funds!"
  end

  def remove_funds(less_funds=15)
    @funding -= less_funds
    puts "Project #{@name} lost some funds!"
  end
end
