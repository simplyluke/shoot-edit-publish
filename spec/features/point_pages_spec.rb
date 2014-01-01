require 'spec_helper'

describe "PointsPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "user page" do
    before { visit user_path(user.username) }
    it { should have_title("Shoot Edit Publish | #{user.username}") }
  end
  
  describe "point deletion" do 
    before { FactoryGirl.create(:point, user: user) }
    describe "correct user" do
      before { visit user_path(user.username) }

      it "should delete link" do
        expect { click_link 'Delete' }.to change(Point, :count).by(-1)
      end
    end
  end
end
