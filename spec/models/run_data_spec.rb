require 'spec_helper'

describe RunData do

  describe "get_data" do
    it "gets data from Nike" do
      rundata = RunData.new
      runs = rundata.get_data
      expect(runs).to be_an Array
    end
  end

end
