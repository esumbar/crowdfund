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

class ProjectCollection
  def initialize(name)
    @name = name
    @projects = []
  end
  
  def add_project(project)
    @projects << project
  end

  def request_funding
    puts "#{@name} comprises #{@projects.size} projects:"
    @projects.each do |p|
      puts p
    end
    @projects.each do |p|
      p.add_funds
      p.add_funds(40)
      p.remove_funds
      puts p
    end
  end
end

project1 = Project.new("lmn", 500, 3000)
project2 = Project.new("xyz", 25, 75)

startup = ProjectCollection.new("VC-Friendly Start-up Projects")
startup.add_project(project1)
startup.add_project(project2)
startup.request_funding
