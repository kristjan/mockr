require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    before(:each) do
      controller.stubs(:authenticate_user!).returns(true)
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
