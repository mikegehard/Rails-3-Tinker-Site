require 'spec_helper'

describe Article do
  it { should have_many(:tags).through(:article_tags) }
  
  it "should require headline" do
    subject.headline = ""
    subject.should_not be_valid

    subject.headline = "Cool Article"
    subject.should be_valid
  end
end
