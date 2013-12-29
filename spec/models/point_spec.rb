require 'spec_helper'

describe Point do

  let(:user) { FactoryGirl.create(:user) }
  before { @point = user.points.build(value: 50) }

  subject { @point }

  it { should respond_to(:value) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @point.user_id = nil }
    it { should_not be_valid }
  end
end
