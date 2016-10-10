require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    before(:each) { get :new }

    it "should render template 'new'" do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "should redirect to goals index page" do
        post :create, user: { username: 'bob', password: "asdfasdf"}
        expect(response).to redirect_to(goals_url)
      end
    end

    context "with invalid params" do
      before(:each) do
        post :create, user: { username: 'bob', password: "asdf" }
      end

      it "should render template 'new'" do
        expect(response).to render_template(:new)
      end
      it "should set error messages" do
        expect(flash[:errors]).to be_truthy
      end
    end
  end
end
