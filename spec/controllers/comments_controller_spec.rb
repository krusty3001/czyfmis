require 'spec_helper'

describe CommentsController do

  before :each do
    sign_in users(:one)
  end
  
  def valid_attributes
    { :user => users(:one), :commentable => albums(:reminder),
      :comment => "I like it" }
  end


  describe "GET edit" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :edit, :id => comment.id
      assigns(:comment).should eq(comment)
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        # Assuming there are no other comments in the database, this
        # specifies that the Comment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => comment.id, :comment => {'these' => 'params'}
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, :id => comment.id, :comment => valid_attributes
        assigns(:comment).should eq(comment)
      end

      it "redirects to the album" do
        comment = Comment.create! valid_attributes
        put :update, :id => comment.id, :comment => valid_attributes
        response.should redirect_to(comment.commentable)
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, :id => comment.id
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, :id => comment.id
      response.should redirect_to(albums(:reminder))
    end
  end


end
