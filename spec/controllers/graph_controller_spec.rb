require 'spec_helper'

describe GraphController do

  describe "index" do
    it "responds successfully" do
      expect(response).to be_success
    end
  end

end
