require 'spec_helper'

describe ArticleTagsController do
  fixtures :articles, :tags

  describe "#create" do
    before(:each) do
      @article = articles(:my_article)
    end
    describe "with valid tag name" do
      describe "when name matches an existing tag" do
        it "should not create a new tag" do
          expect do
            post :create, :article_id => @article.id, :tag => {:name => "Hot Stuff"}
          end.to_not change { Tag.count }
        end
      end

      describe "when name doesn't match an existing tag" do
        it "should create a new tag" do
          expect do
            post :create, :article_id => @article.id, :tag => {:name => "Really Cool"}
          end.to change { Tag.count }.by(1)
        end
      end
    end

  end
end
