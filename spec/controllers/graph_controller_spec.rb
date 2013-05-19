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

  describe "morris" do

    before(:each) do
      get :morris
      @body = JSON.parse(response.body)
    end

    it "responds successfully to morris.json" do
      expect(response).to be_success
    end

    it "returns an Array" do
      expect(@body).to be_an Array
    end

    it "returns an Array of hashes" do
      expect(@body[0]).to be_a Hash
    end

    it "returns total distance per month" do
    expect(@body[0]["title"]).to eq "January"
    expect(@body[0]["value"]).to eq 60.19
  end

  end

end
