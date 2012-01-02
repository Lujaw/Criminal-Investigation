require "spec_helper"

describe CriminalsController do
  describe "routing" do

    it "routes to #index" do
      get("/criminals").should route_to("criminals#index")
    end

    it "routes to #new" do
      get("/criminals/new").should route_to("criminals#new")
    end

    it "routes to #show" do
      get("/criminals/1").should route_to("criminals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/criminals/1/edit").should route_to("criminals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/criminals").should route_to("criminals#create")
    end

    it "routes to #update" do
      put("/criminals/1").should route_to("criminals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/criminals/1").should route_to("criminals#destroy", :id => "1")
    end

  end
end
