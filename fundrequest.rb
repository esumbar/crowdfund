require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_pool'

class FundRequest
  def initialize(name)
    @name = name
    @projects = []
  end
  
  def add_project(project)
    @projects << project
  end

  def print_stats
    fully_funded, under_funded = @projects.partition { |p| p.fully_funded? }

    puts "\nNumber of fully funded projects: #{fully_funded.size}"

    puts "\nNumber of under funded projects: #{under_funded.size}"

    puts "\nUnder funded projects and their shortfalls:"
    under_funded.sort.each do |p|
      formatted_name = p.name.ljust(20, '.')
      puts "#{formatted_name} $#{p.funding_shortfall}"
    end
  end

  def request_funding(rounds)
    puts "\n#{@name} comprises #{@projects.size} projects:"
    @projects.each do |p|
      puts p
    end

    puts "\nThere are 3 possible pledge amounts:"
    PledgePool::PLEDGES.each do |p|
      puts "A #{p.name} pledge is worth $#{p.amount}."
    end

    1.upto(rounds) do |round|
      puts "\nFunding round #{round}:"
      @projects.each do |p|
        FundingRound.seek_funding(p)
      end      
    end
  end
end
