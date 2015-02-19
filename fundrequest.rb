require_relative 'project'

class FundRequest
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
