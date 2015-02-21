require_relative 'project'
require_relative 'die'

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
      number_rolled = Die.new.roll
      if number_rolled.even?
        p.add_funds
      else
        p.remove_funds
      end
    end
  end
end
