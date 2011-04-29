class ArticleTagCreator
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def initialize(article_id, tag_name)
    @tag = Tag.new(:name => tag_name) unless tag_name.nil?
    @article = Article.find_by_id(article_id)
  end

  def persisted?
    false
  end

  def save
    @article && @tag && @tag.save && ArticleTag.new(:tag => @tag, :article => @article).save
  end
end