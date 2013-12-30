require 'spec_helper'

describe "Users" do
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:p1) { FactoryGirl.create(:point, user: user, value: 50, activity: 'published') }
    let!(:p2) { FactoryGirl.create(:point, user: user, value: 75, activity: 'shot') }

    before { visit user_path(user) }

    it { should have_content(user.username) }

    describe "points" do
      it { should have_content(p1.value) }
      it { should have_content(p2.value) }

      it { should have_content(user.points.sum('value')) }
    end
  end
end
