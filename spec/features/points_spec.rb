require 'spec_helper'

describe "PointsPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  pending("write tests to let users create new points via their homepage")

end
