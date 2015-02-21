require_relative 'fundrequest'

describe FundRequest do
  before do
    @funding_campaign = FundRequest.new("A Funding Campaign")

    @target_funding = 75
    @initial_funding = 25
    @project = Project.new("a project", @target_funding, @initial_funding)

    @funding_campaign.add_project(@project)
    $stdout = StringIO.new
  end

  context "when an even number is rolled" do
    it "project funding is increased by 25 by default" do
      allow_any_instance_of(Die).to receive(:roll).and_return(2)
      @funding_campaign.request_funding
      expect(@project.funding).to eq(@initial_funding + 25)
    end
  end

  context "when an odd number is rolled" do
    it "project funding is decreased by 15 by default" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      @funding_campaign.request_funding
      expect(@project.funding).to eq(@initial_funding - 15)
    end
  end
end
