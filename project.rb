class Project
  
  attr_accessor :name
  attr_reader :funding, :target

  def initialize(name, target, funding=0)
    @name = name.upcase
    @funding = funding
    @target = target
  end

  def name=(new_name)
    @name = new_name.upcase
  end
  
  def funding_shortfall
    @target - @funding
  end

  def fully_funded?
    funding_shortfall <= 0
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
