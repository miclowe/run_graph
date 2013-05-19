require 'spec_helper'

describe RunData do

  before(:each) do
    rundata = RunData.new
    @runs = rundata.get_data
  end

  it "gets data from Nike" do
    expect(@runs).to be_an Array
  end

  it "returns at least one result" do
    expect(@runs.size).to be > 0
  end

  it "returns start_date and distance data" do
    expect(@runs[0]["start_time_utc"]).to be_true
    expect(@runs[0]["metrics"]["distance"]).to be_true
  end

  it "outputs current year data" do
    date = @runs[0]["start_time_utc"]
    run_year = Date.parse(date).year
    expect(@runs).not_to include run_year
  end

  it "calculates total distance" do
    dist1 = @runs[0]["metrics"]["distance"]
    dist2 = @runs[1]["metrics"]["distance"]
    total_distance = dist1 + dist2
    expect(total_distance).to be > 0
  end

end
