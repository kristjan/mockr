require 'spec_helper'

describe User do
  it "has a valid factory" do
    create(:user).should be_valid
  end  

  it "is not valid with a blank name" do
    build(:user, name: "").should_not be_valid
  end
end
