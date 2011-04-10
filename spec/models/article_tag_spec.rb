require 'spec_helper'

describe ArticleTag do
  it { should belong_to(:article) }

  it { should belong_to(:tag) }
end
