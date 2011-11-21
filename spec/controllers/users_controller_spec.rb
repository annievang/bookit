require 'spec_helper'

describe UsersController do
  render_views

describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    end

  end

  describe "GET 'new'" do

    it "should be successful" do
      get 'new'
      response.should be_success
    end


    describe "for non-signed-in users" do
      it "should deny access" do
        get :index
        response.should redirect_to(signin_path)
      end
    end
    
    describe "for signed-in-users" do
      
      it "should be successful" do
        get :index
        response.should redirect_to(signin_path)
      end
      
    end
  end
  
  describe "authentication of edit/update actions" do
    
    before(:each) do
      @user = Factory(:user)
    end

    describe "for non-signed-in users" do

      it "should deny access to 'edit'" do
        get :edit, :id => @user
        response.should redirect_to(signin_path)
        flash[:notice].should =~ /sign in/i
      end
    
      it "should deny access to 'update'" do
        put :update, :id => @user, :user => {}
        response.should redirect_to(signin_path)
      end
    end

   
  end


end