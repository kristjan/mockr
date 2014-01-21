require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    before(:each) do
      sign_in(create(:user))
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
