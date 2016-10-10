require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password) }
  end

  describe "associations" do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe "class methods" do
    describe "::find_by_credentials" do
      context "with valid params" do
        it "should return user" do
          FactoryGirl.create(:user, password: "asdfasdf")
          user = User.last

          expect(User.find_by_credentials(user.username, "asdfasdf")).to eq(user)
        end
      end

      context "with invalid params" do
        it "should return nil" do
          expect(User.find_by_credentials("bob", "asdf")).to be nil
        end
      end
    end
  end

  describe "instance methods" do
    describe "ensure_session_token" do
      it "should assign user a session_token" do
        user = FactoryGirl.build(:user)
        expect(user.session_token).to be_truthy
      end
    end

    describe "reset_session_token" do
      it "should assign a different session_token to user" do
        user = FactoryGirl.build(:user)
        old_session_token = user.session_token
        user.reset_session_token

        expect(user.session_token).not_to eq(old_session_token)
      end
    end

    describe "password=" do
      it "should create password_digest for user" do
        user = FactoryGirl.build(:user)
        expect(user.password_digest).to be_truthy
      end

      it "should assign value to instance variable password" do
        user = FactoryGirl.build(:user, password: "asdfasdf")
        expect(user.password).to eq("asdfasdf")
      end
    end

    describe "is_password?" do
      it "should return true if password matches" do
        user = FactoryGirl.create(:user, password: "asdfasdf")
        expect(user.is_password?("asdfasdf")).to be true
      end

      it "should return false if password doesn't match" do
        user = FactoryGirl.create(:user, password: "asdfasdf")
        expect(user.is_password?("asdfasd")).to be false
      end
    end
  end
end
