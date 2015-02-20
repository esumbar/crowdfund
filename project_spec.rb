require_relative 'project'

describe Project do
  before do
    @funding = 1500
    @target = 3000
    @project = Project.new("abc", @target, @funding)
    $stdout = StringIO.new
  end

  it "has an initial target funding amount" do
    expect(@project.target).to eq(@target)
  end

  it "computes outstanding funding as target minus funding" do
    expect(@project.funding_shortfall).to eq(@target - @funding)
  end

  it "increases funds by 25 when funds are added" do
    @project.add_funds
    expect(@project.funding).to eq(@funding + 25)
  end

  it "desceases funds by 15 when funds are removed" do
    @project.remove_funds
    expect(@project.funding).to eq(@funding - 15)
  end

  context "with default funding" do
    before do
      @project = Project.new("abc", 3000)
    end

    it "has a default value of 0 for funding amount" do
      expect(@project.funding).to eq(0)
    end
  end
end
