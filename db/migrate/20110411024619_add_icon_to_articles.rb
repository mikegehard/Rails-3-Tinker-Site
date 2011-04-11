class AddIconToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :icon, :string
  end

  def self.down
    remove_column :articles, :icon
  end
end
