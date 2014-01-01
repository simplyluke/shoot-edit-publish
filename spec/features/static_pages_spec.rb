require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title('Shoot Edit Publish') }
    it { should_not have_title('Shoot Edit Publish |') }

    describe "with a signed in user" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_content('Today I...') }

      describe "point creation" do
        it "should create a new point listing" do
          expect { click_button "Shot" }.to change(Point, :count).by(1)
        end
      end
    end
  end

  describe "About page" do
    before { visit about_path }

    it { should have_title('Shoot Edit Publish | About') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_title('Shoot Edit Publish | Help') }
  end
end
