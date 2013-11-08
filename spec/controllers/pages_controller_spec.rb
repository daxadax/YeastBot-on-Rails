require 'spec_helper'

describe PagesController do

  describe "home" do
    
    it "has a home page" do
      get "home"
      response.should be_successful
    end
    
  end


  describe "search" do
    
    it "has a search page" do
      get "search"
      response.should be_successful
    end
      
  end
  
end
