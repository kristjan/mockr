require "spec_helper"

describe MocksController do
  describe "routing" do

    it "routes to #index" do
      get("/mocks").should route_to("mocks#index")
    end

    it "routes to #new" do
      get("/mocks/new").should route_to("mocks#new")
    end

    it "routes to #show" do
      get("/mocks/1").should route_to("mocks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mocks/1/edit").should route_to("mocks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mocks").should route_to("mocks#create")
    end

    it "routes to #update" do
      put("/mocks/1").should route_to("mocks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mocks/1").should route_to("mocks#destroy", :id => "1")
    end

  end
end
