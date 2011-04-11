require 'spec_helper'

describe Article do
  it { should have_many(:tags).through(:article_tags) }
  
  it "should require headline" do
    subject.headline = ""
    subject.should_not be_valid

    subject.headline = "Cool Article"
    subject.should be_valid
  end

  it "should have a icon field uploader field" do
    subject.headline = "Headline"
    subject.icon = File.open(File.join(Rails.root, 'spec', 'fixtures', 'images', 'icon-100x100.png'))
    subject.save!
    subject.icon.url =~ /icon-100x100.png/
  end
end
