require 'spec_helper'

describe Point do

  before { @point = FactoryGirl.create(:point) }

  subject { @point }

  it { should respond_to(:value) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:type) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @point.user_id = nil }
    it { should_not be_valid }
  end
end
