require 'spec_helper'

describe IconUploader do
  it "should have the proper store_dir" do
    article = articles(:my_article)
    IconUploader.new(article, :icon).store_dir.should == "images/article/icon/147038796"
  end
end