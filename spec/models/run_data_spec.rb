require 'spec_helper'

describe RunData do

  before(:each) do
    me = Nike::Client.new(ENV['NIKE_USERNAME'], ENV['NIKE_PASSWORD'])
    @activities = me.activities(type: :run)
  end

  it "gets data from Nike" do
    expect(@activities).to be_an Array
  end

  it "returns at least one result" do
    expect(@activities.size).to be > 0
  end

  it "returns start_date and distance data" do
    start_time = @activities[0]["start_time_utc"]
    distance = @activities[0]["metrics"]["distance"]
    expect(start_time).to be_true
    expect(distance).to be_true
  end

  it "returns current year data" do
    run1 = @activities.last
    run1_yr = run1.start_time_utc.year
    run1_dist = run1.metrics.distance
    total_distance = 0
    if run1_yr == Time.now.year
      total_distance += run1_dist
    end
    expect(total_distance).to be > 0
  end

  it "calculates total distance" do
    run1_dist = @activities[0]["metrics"]["distance"]
    run2_dist = @activities[1]["metrics"]["distance"]
    total_distance = run1_dist + run2_dist
    expect(total_distance).to be > 0
  end

  it "returns an array of hashes" do
    rundata = RunData.new
    runs = rundata.get_data
    expect(runs).to be_an Array
    expect(runs[0]).to be_a Hash
  end

  it "returns total distance per month" do
    rundata = RunData.new
    runs = rundata.get_data
    expect(runs[0][:title]).to eq "January"
    expect(runs[0][:value]).to eq 60.19
  end

end
