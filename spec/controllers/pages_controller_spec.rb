require 'spec_helper'

describe PagesController do
render_views

  describe "GET 'home'" do
    
    describe "when not signed in" do
      it "should be successful" do
        get 'home'
        response.should be_success
      end
    end
    
    
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "should be successful" do
      get 'search'
      response.should be_success
    end
  end
  
end
