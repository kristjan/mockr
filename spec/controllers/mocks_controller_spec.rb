require 'spec_helper'

describe MocksController do

  before(:each) do
    sign_in create(:user)
  end

  describe "GET index" do
    let(:mock) { create :mock }

    it "assigns all mocks as @mocks" do
      get :index, {}
      assigns(:mocks).should eq([mock])
    end
  end

  describe "GET show" do
    let(:mock) { create :mock }

    it "assigns the requested mock as @mock" do
      get :show, {:id => mock.to_param}
      assigns(:mock).should eq(mock)
    end
  end

  describe "GET new" do
    it "assigns a new mock as @mock" do
      get :new, {}
      assigns(:mock).should be_a_new(Mock)
    end
  end

  describe "GET edit" do
    let(:mock) { create :mock }

    it "assigns the requested mock as @mock" do
      get :edit, {:id => mock.to_param}
      assigns(:mock).should eq(mock)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:attributes) { attributes_for :mock }

      it "creates a new Mock" do
        expect {
          post :create, {:mock => attributes}
        }.to change(Mock, :count).by(1)
      end

      it "sets the logged-in user as the creator" do
        post :create, {mock: attributes}
        assigns(:mock).creator.should == subject.current_user
      end

      it "assigns a newly created mock as @mock" do
        post :create, {mock: attributes}
        assigns(:mock).should be_a(Mock)
        assigns(:mock).should be_persisted
      end

      it "redirects to the created mock" do
        post :create, {mock: attributes}
        response.should redirect_to(Mock.last)
      end
    end

    describe "with invalid params" do
      let(:attributes) do
        {'image' => :not_an_image}
      end

      it "assigns a newly created but unsaved mock as @mock" do
        # Trigger the behavior that occurs when invalid params are submitted
        Mock.any_instance.stubs(:save).returns(false)
        post :create, {mock: attributes}
        assigns(:mock).should be_a_new(Mock)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Mock.any_instance.stubs(:save).returns(false)
        post :create, {mock: attributes}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let!(:mock) { create :mock }
      let(:attributes) { attributes_for :mock }

      it "updates the requested mock" do
        new_image = MockSpecHelper.random_image_file
        # Assuming there are no other mocks in the database, this
        # specifies that the Mock created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Mock.any_instance.expects(:update).with('image' => new_image)
        put :update, { id: mock.to_param, mock: { 'image' => new_image } }
      end

      it "assigns the requested mock as @mock" do
        put :update, {:id => mock.to_param, mock: attributes}
        assigns(:mock).should eq(mock)
      end

      it "redirects to the mock" do
        put :update, {:id => mock.to_param, mock: attributes}
        response.should redirect_to(mock)
      end
    end

    describe "with invalid params" do
      let!(:mock) { create :mock }

      let(:attributes) do
        { 'creator_id' => :not_an_image }
      end

      it "assigns the mock as @mock" do
        # Trigger the behavior that occurs when invalid params are submitted
        Mock.any_instance.stubs(:save).returns(false)
        put :update, {id: mock.to_param, mock: attributes}
        assigns(:mock).should eq(mock)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Mock.any_instance.stubs(:save).returns(false)
        put :update, {:id => mock.to_param, mock: attributes}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:mock) { create :mock }

    it "destroys the requested mock" do
      expect {
        delete :destroy, {:id => mock.to_param}
      }.to change(Mock, :count).by(-1)
    end

    it "redirects to the mocks list" do
      delete :destroy, {:id => mock.to_param}
      response.should redirect_to(mocks_url)
    end
  end

end
