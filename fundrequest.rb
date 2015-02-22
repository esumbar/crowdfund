require_relative 'project'
require_relative 'funding_round'

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
      FundingRound.seek_funding(p)
    end
  end
end
