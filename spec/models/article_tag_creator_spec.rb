require 'spec_helper'

describe ArticleTagCreator do
  before(:each) do
    article = articles(:my_article)
    @article_id = article.id
    @tag_name = "Hot Stuff"
    @creator = ArticleTagCreator.new(@article_id, @tag_name)
  end

  it_behaves_like "ActiveModel"

  describe "#save" do
    describe "with existing article and tag name that" do
      describe "is valid" do
        it "should return true" do
          @creator.save.should be_true
        end
        it "should create an ArticleTag" do
          expect { @creator.save }.to change { ArticleTag.count }.by(1)
        end
        it "should create a Tag" do
          expect { @creator.save }.to change { Tag.count }.by(1)
        end
      end
      describe "is invalid" do
        before(:each) do
          @creator = ArticleTagCreator.new(@article_id, "")
        end
        it "should return false" do
          @creator.save.should be_false
        end
        it "should not create an ArticleTag" do
          expect { @creator.save }.to_not change { ArticleTag.count }
        end
        it "should not create a Tag" do
          expect { @creator.save }.to_not change { Tag.count }
        end
      end
      describe "is nil" do
        before(:each) do
          @creator = ArticleTagCreator.new(@article_id, nil)
        end
        it "should return false" do
          @creator.save.should be_false
        end
        it "should not create an ArticleTag" do
          expect { @creator.save }.to_not change { ArticleTag.count }
        end
        it "should not create a Tag" do
          expect { @creator.save }.to_not change { Tag.count }
        end
      end
    end
    describe "with valid tag name and article_id" do
      describe "is from an existing article" do
        it "should return true" do
          @creator.save.should be_true
        end
        it "should create an ArticleTag" do
          expect { @creator.save }.to change { ArticleTag.count }.by(1)
        end
        it "should create a Tag" do
          expect { @creator.save }.to change { Tag.count }.by(1)
        end
      end
      describe "is nil" do
        before(:each) do
          @creator = ArticleTagCreator.new(nil, @tag_name)
        end
        it "should return false" do
          @creator.save.should be_false
        end
        it "should not create an ArticleTag" do
          expect { @creator.save }.to_not change { ArticleTag.count }
        end
        it "should not create a Tag" do
          expect { @creator.save }.to_not change { Tag.count }
        end
      end
      describe "is from an non-existent article" do
        before(:each) do
          @creator = ArticleTagCreator.new(1, @tag_name)
        end
        it "should return false" do
          @creator.save.should be_false
        end
        it "should not create an ArticleTag" do
          expect { @creator.save }.to_not change { ArticleTag.count }
        end
        it "should not create a Tag" do
          expect { @creator.save }.to_not change { Tag.count }
        end
      end
    end
  end
end