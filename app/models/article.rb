class Article < ActiveRecord::Base
  validates :headline, :presence => true
end
