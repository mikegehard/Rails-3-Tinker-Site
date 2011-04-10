require 'spec_helper'

describe Tag do
  it "should require name" do
    subject.name = ""
    subject.should_not be_valid

    subject.name = "Hot Stuff"
    subject.should be_valid
  end

  it "should validate length of name to 40 characters or less" do
    subject.name = "a" * 40
    subject.should be_valid

    subject.name = "a" * 41
    subject.should_not be_valid
  end
end
