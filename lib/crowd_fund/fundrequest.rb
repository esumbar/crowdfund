require "csv"
require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_pool'

module CrowdFund
  class FundRequest

    def initialize(name)
      @name = name
      @projects = []
    end

    def formatted_under_funded(project)
      formatted_name = project.name.ljust(20, '.')
      "#{formatted_name} $#{project.funding_shortfall}"
    end

    def save_under_funded(under_funded_file="under_funded.txt")
      File.open(under_funded_file, "w") do |file|
        file.puts "Under funded projects and their shortfalls:"
        under_funded = @projects.reject { |p| p.fully_funded? }
        under_funded.sort.each do |p|
          file.puts self.formatted_under_funded(p)
        end
      end
    end

    def from_file(project_file)
      CSV.foreach(project_file) do |row|
        name, target, funding = row
        project = Project.new(name, Integer(target), Integer(funding))
        self.add_project(project)
      end
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

      @projects.each do |project|
        puts "\nProject #{project.name}'s pledges:"
        project.each_pledge do |pledge|
          puts "$#{pledge.amount} in #{pledge.name} pledges"
        end
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
end
