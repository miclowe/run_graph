require 'spec_helper'

describe GraphController do

  describe "index" do
    it "responds successfully" do
      expect(response).to be_success
    end
  end

  describe "statusboard" do

    before(:each) do
      get :statusboard
      @body = JSON.parse(response.body)
    end

    it "responds successfully to statusboard.json" do
      expect(response).to be_success
    end

    it "returns a data hash" do
      expect(@body).to be_a Hash
    end

    it "returns a data hash that contains a graph key" do
      expect(@body["graph"]).to be_a Hash
    end

  end

end
