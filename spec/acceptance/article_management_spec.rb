require 'spec_helper'


feature "Managing Articles" do
  scenario "Creating an article" do
    visit new_article_url
    fill_in("Headline", :with => "Cool Stuff")
    attach_file("Icon", File.join(Rails.root, 'spec', 'fixtures', 'images', 'icon-100x100.png'))
    click_button("Create Article")
    current_path.should == articles_path
    page.should have_content("Cool Stuff")
    page.should have_xpath("//img[@alt='Icon-100x100']")
  end
end
