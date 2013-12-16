require 'spec_helper'

describe CommentsController do

  before(:each) do
    sign_in create(:user)
  end

  describe "GET index" do
    let(:comment) { create :comment }

    it "assigns all comments as @comments" do
      get :index, {}
      assigns(:comments).should eq([comment])
    end
  end

  describe "GET show" do
    let(:comment) { create :comment }

    it "assigns the requested comment as @comment" do
      get :show, {:id => comment.to_param}
      assigns(:comment).should eq(comment)
    end
  end

  describe "GET new" do
    it "assigns a new comment as @comment" do
      get :new, {}
      assigns(:comment).should be_a_new(Comment)
    end
  end

  describe "GET edit" do
    let(:comment) { create :comment }

    it "assigns the requested comment as @comment" do
      get :edit, {:id => comment.to_param}
      assigns(:comment).should eq(comment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let(:attributes) { build(:comment).attributes }

      it "creates a new Comment" do
        expect {
          post :create, {comment: attributes}
        }.to change(Comment, :count).by(1)
      end

      it "sets the logged-in user as the author" do
        post :create, {comment: attributes}
        assigns(:comment).author.should == subject.current_user
      end

      it "assigns a newly created comment as @comment" do
        post :create, {comment: attributes}
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the comment's mock" do
        post :create, {comment: attributes}
        response.should redirect_to(Comment.last.mock)
      end
    end

    describe "with invalid params" do
      let(:attributes) do
        {'body' => nil}
      end

      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stubs(:save).returns(false)
        post :create, {:comment => attributes}
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stubs(:save).returns(false)
        post :create, {:comment => attributes}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    let!(:comment) { create :comment }
    let(:attributes) { attributes_for :comment }

    describe "with valid params" do
      it "updates the requested comment" do
        # Assuming there are no other comments in the database, this
        # specifies that the Comment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comment.any_instance.expects(:update).with({ 'body' => 'Foo' })
        put :update, {:id => comment.to_param, :comment => { 'body' => 'Foo' }}
      end

      it "assigns the requested comment as @comment" do
        put :update, {:id => comment.to_param, :comment => attributes}
        assigns(:comment).should eq(comment)
      end

      it "redirects to the comment" do
        put :update, {:id => comment.to_param, :comment => attributes}
        response.should redirect_to(comment)
      end
    end

    describe "with invalid params" do
      let!(:comment) { create :comment }
      let(:attributes) do
        { 'body' => nil }
      end

      it "assigns the comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stubs(:save).returns(false)
        put :update, {:id => comment.to_param, :comment => attributes}
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stubs(:save).returns(false)
        put :update, {:id => comment.to_param, :comment => attributes}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:comment) { create :comment }

    it "destroys the requested comment" do
      expect {
        delete :destroy, {:id => comment.to_param}
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      delete :destroy, {:id => comment.to_param}
      response.should redirect_to(comments_url)
    end
  end

end
