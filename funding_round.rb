require_relative 'project'
require_relative 'die'

module FundingRound
  def self.seek_funding(project)
    number_rolled = Die.new.roll
    if number_rolled.even?
      project.add_funds
    else
      project.remove_funds
    end
  end
end
