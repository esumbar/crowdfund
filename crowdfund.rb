class Project
  def initialize(name, funding, target)
    @name = name.upcase
    @funding = funding
    @target = target
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

project1 = Project.new("lmn", 500, 3000)
puts project1

project2 = Project.new("xyz", 25, 75)
puts project2

project1.remove_funds
project2.add_funds

puts project1
puts project2
