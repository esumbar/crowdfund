require_relative 'project'

class MatchingProject < Project

  def initialize(name, target, funding=0)
    super
    @received_matching_funding = false
  end

  def half_funded?
    self.funding_shortfall <= (@target / 2.0)
  end

  def match_funds
    unless @received_matching_funding
      if half_funded?
        @funding += self.total_funding
        puts "Project #{@name} received matching funds"
        @received_matching_funding = true
      end
    end    
  end

  def received_pledge(pledge)
    super
    self.match_funds
  end

  def add_funds(more_funds=25)
    super
    self.match_funds
  end

end

if __FILE__ == $0
  match = MatchingProject.new("match", 1000)
  puts "#{match.funding_shortfall} shortfall before"
  match.add_funds(500)
  puts "#{match.funding_shortfall} shortfall after"
end
