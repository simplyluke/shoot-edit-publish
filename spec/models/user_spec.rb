require 'spec_helper'

describe User do
  before { @user = User.new(email: "luke@simplyluke.com", username: "cenhyperion", 
                            password: "testtest", password_confirmation: "testtest")}

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:username) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " } 
    it { should_not be_valid } 
  end

  describe "when email is garbage" do
    before { @user.email = "hafek$%@lkadjf.fe" }
    it { should_not be_valid }
  end
end
