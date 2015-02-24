require_relative 'project'
require_relative 'die'
require_relative 'pledge_pool'

module FundingRound
  def self.seek_funding(project)
    number_rolled = Die.new.roll
    if number_rolled.even?
      project.add_funds
    else
      project.remove_funds
    end
    project.received_pledge(PledgePool.random)
  end
end
