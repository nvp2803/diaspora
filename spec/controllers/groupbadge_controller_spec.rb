require 'spec_helper'

describe GroupbadgeController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'target'" do
    it "returns http success" do
      get 'target'
      response.should be_success
    end
  end

end
