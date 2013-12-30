require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title('Shoot Edit Publish') }
    it { should_not have_title('Shoot Edit Publish |') }

    pending("write tests for signed in home page with functions to add points")
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
