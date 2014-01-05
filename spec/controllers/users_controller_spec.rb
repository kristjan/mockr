require 'spec_helper'

describe UsersController do

  before(:each) do
    sign_in create(:user)
  end

  describe "GET index" do
    let(:user) { create :user }

    it "assigns all users as @users" do
      get :index
      assigns(:users).should eq([subject.current_user, user])
    end
  end

  describe "GET show" do
    let(:user) { create :user }

    it "assigns the requested user as @user" do
      get :show, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

end
