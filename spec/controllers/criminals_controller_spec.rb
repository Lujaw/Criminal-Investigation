require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CriminalsController do

  # This should return the minimal set of attributes required to create a valid
  # Criminal. As you add validations to Criminal, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all criminals as @criminals" do
      criminal = Criminal.create! valid_attributes
      get :index
      assigns(:criminals).should eq([criminal])
    end
  end

  describe "GET show" do
    it "assigns the requested criminal as @criminal" do
      criminal = Criminal.create! valid_attributes
      get :show, :id => criminal.id
      assigns(:criminal).should eq(criminal)
    end
  end

  describe "GET new" do
    it "assigns a new criminal as @criminal" do
      get :new
      assigns(:criminal).should be_a_new(Criminal)
    end
  end

  describe "GET edit" do
    it "assigns the requested criminal as @criminal" do
      criminal = Criminal.create! valid_attributes
      get :edit, :id => criminal.id
      assigns(:criminal).should eq(criminal)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Criminal" do
        expect {
          post :create, :criminal => valid_attributes
        }.to change(Criminal, :count).by(1)
      end

      it "assigns a newly created criminal as @criminal" do
        post :create, :criminal => valid_attributes
        assigns(:criminal).should be_a(Criminal)
        assigns(:criminal).should be_persisted
      end

      it "redirects to the created criminal" do
        post :create, :criminal => valid_attributes
        response.should redirect_to(Criminal.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved criminal as @criminal" do
        # Trigger the behavior that occurs when invalid params are submitted
        Criminal.any_instance.stub(:save).and_return(false)
        post :create, :criminal => {}
        assigns(:criminal).should be_a_new(Criminal)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Criminal.any_instance.stub(:save).and_return(false)
        post :create, :criminal => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested criminal" do
        criminal = Criminal.create! valid_attributes
        # Assuming there are no other criminals in the database, this
        # specifies that the Criminal created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Criminal.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => criminal.id, :criminal => {'these' => 'params'}
      end

      it "assigns the requested criminal as @criminal" do
        criminal = Criminal.create! valid_attributes
        put :update, :id => criminal.id, :criminal => valid_attributes
        assigns(:criminal).should eq(criminal)
      end

      it "redirects to the criminal" do
        criminal = Criminal.create! valid_attributes
        put :update, :id => criminal.id, :criminal => valid_attributes
        response.should redirect_to(criminal)
      end
    end

    describe "with invalid params" do
      it "assigns the criminal as @criminal" do
        criminal = Criminal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Criminal.any_instance.stub(:save).and_return(false)
        put :update, :id => criminal.id, :criminal => {}
        assigns(:criminal).should eq(criminal)
      end

      it "re-renders the 'edit' template" do
        criminal = Criminal.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Criminal.any_instance.stub(:save).and_return(false)
        put :update, :id => criminal.id, :criminal => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested criminal" do
      criminal = Criminal.create! valid_attributes
      expect {
        delete :destroy, :id => criminal.id
      }.to change(Criminal, :count).by(-1)
    end

    it "redirects to the criminals list" do
      criminal = Criminal.create! valid_attributes
      delete :destroy, :id => criminal.id
      response.should redirect_to(criminals_url)
    end
  end

end
