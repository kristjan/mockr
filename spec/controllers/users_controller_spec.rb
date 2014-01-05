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
      get :show, {id: user.to_param}
      assigns(:user).should eq(user)
    end

    context "their mocks" do
      let!(:mocks) do
        [
          create(:mock, creator: user, created_at: Time.now - 1.day),
          create(:mock, creator: user)
        ]
      end

      before(:each) do
        get :show, {id: user.to_param}
      end

      it "assigns them as @mocks" do
        assigns(:mocks).should =~ mocks
      end

      it "sorts them reverse chronologically" do
        assigns(:mocks).map(&:created_at).should ==
          assigns(:mocks).map(&:created_at).sort.reverse
      end
    end
  end

end
