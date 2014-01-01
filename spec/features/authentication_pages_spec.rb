require 'spec_helper'

# Sure maybe devise is dealing with this, 
# but adding basic test coverage to the suite
# is a good idea

describe "AuthenticationPages" do
  subject { page }

  describe "signin page" do
    before { visit new_user_session_path }

    it { should have_link('Sign up') }

    describe "with bad info" do
      before { click_button 'Sign in' }

      it { should have_content('Invalid') }
    end

    describe "with good info" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_content('Signed in successfully') }
      it { should_not have_link('Sign up') }
      it { should_not have_link('Sign in') }
      it { should have_content('Today I') }
      it { should have_button('Shot') }
      it { should have_button('Edited') }
      it { should have_button('Published') }
      it { should have_link('Sign out') }

      describe "when user signs out" do
        before { click_link('Sign out') }
        it { should have_content('Signed out successfully') }
        it { should have_link('Sign in') }
        it { should_not have_link('Me') }
        it { should_not have_link('Users') }
      end
    end
  end

  pending("auth tests")
end
