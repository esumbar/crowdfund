class Project
  
  attr_accessor :name
  attr_reader :funding, :target

  def initialize(name, funding, target)
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
project2 = Project.new("xyz", 25, 75)

projects = [project1, project2]

puts "There are #{projects.size} projects in the fundraising program:"
projects.each do |project|
  puts project
end

projects.each do |project|
  puts project.target
end

projects.each do |project|
  project.add_funds
  project.remove_funds
  puts project
end

projects.pop
projects.push Project.new("abc", 200, 1000)
projects.each do |project|
  puts project
end
