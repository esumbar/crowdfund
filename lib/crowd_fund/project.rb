require_relative 'pledge_pool'
require_relative 'fundable'

module CrowdFund
  class Project

    include Fundable
    
    attr_accessor :name, :funding
    attr_reader :target

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

    def each_pledge
      @pledges.each do |name, amount|
        yield Pledge.new(name, amount)
      end
    end

    def funding_shortfall
      @target - self.total_funding
    end

    def <=>(other)
      other.funding_shortfall <=> self.funding_shortfall
    end

    def to_s
      "Project #{@name} has $#{@funding} in funding towards a goal of $#{@target}."
    end

  end
end
