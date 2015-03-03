require 'crowd_fund/pledge_pool'

module CrowdFund
  describe "Pledge" do

    before do
      @pledge = Pledge.new(:abc, 99)
    end

    it "has a name attribute" do
      expect(@pledge.name).to eq(:abc)
    end

    it "has an amount attribute" do
      expect(@pledge.amount).to eq(99)
    end

  end

  describe "PledgePool" do
    
    it "has 3 pledge levels" do
      expect(PledgePool::PLEDGES.size).to eq(3)
    end

    it "has a bronze pledge of $50" do
      expect(PledgePool::PLEDGES[0]).to eq(Pledge.new(:bronze, 50))
    end

    it "has a silver pledge of $75" do
      expect(PledgePool::PLEDGES[1]).to eq(Pledge.new(:silver, 75))
    end

    it "has a gold pledge of $100" do
      expect(PledgePool::PLEDGES[2]).to eq(Pledge.new(:gold, 100))
    end

    it "returns a random pledge" do
      pledge = PledgePool.random
      expect(PledgePool::PLEDGES).to include(pledge)
    end

  end
end
