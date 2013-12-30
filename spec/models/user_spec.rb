require 'spec_helper'

describe User do
  before { @user = User.new(email: "luke@simplyluke.com", username: "cenhyperion", 
                            password: "testtest", password_confirmation: "testtest")}

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:username) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:points) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " } 
    it { should_not be_valid } 
  end

  describe "when email is garbage" do
    before { @user.email = "hafek$%@lkadjf.fe" }
    it { should_not be_valid }
  end


  describe "points association" do
    before { @user.save }

    let!(:older_point) { FactoryGirl.create(:point, user: @user, created_at: 1.week.ago) }
    let!(:newer_point) { FactoryGirl.create(:point, user: @user, created_at: 2.days.ago) }


    it "Should destroy associated points" do

      points = @user.points.to_a
      @user.destroy
      expect(points).not_to be_empty
      points.each do |point|
        expect(Point.where(id: point.id)).to be_empty
      end
    end
  end
end
