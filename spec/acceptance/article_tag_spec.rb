require "spec_helper"


feature "Managing tags" do
fixtures :articles
  scenario "Adding a tag to an article" do
    @article = articles(:my_article)
    visit article_url(@article)
    click_link("Edit Tags")
    current_path.should == article_tags_path(@article)
    page.should have_no_content("Hot Stuff")
    click_link("New Tag")
    fill_in("Name", :with => "Hot Stuff")
    click_button("Create Tag")
    current_path.should == article_tags_path(@article)
    page.should have_content("Hot Stuff")
  end
end