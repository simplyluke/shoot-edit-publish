require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title('Shoot Edit Publish') }
    it { should_not have_title('Shoot Edit Publish |') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_title('Shoot Edit Publish | About') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_title('Shoot Edit Publish | Help') }
  end

  describe "jesus easter egg" do
    before { visit jesus_path }

    it { should have_title('Shoot Edit Publish | Jesus') }
  end
end
