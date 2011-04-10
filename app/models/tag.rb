class Tag < ActiveRecord::Base
  validates :name, :presence => true, :length => 1..40, :uniqueness => true
end
