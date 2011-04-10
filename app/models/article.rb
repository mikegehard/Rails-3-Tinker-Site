class Article < ActiveRecord::Base
  validates :headline, :presence => true

  has_many :article_tags
  has_many :tags, :through => :article_tags
end
