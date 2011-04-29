#see http://stackoverflow.com/questions/5614661/capybara-submit-button-incompatible-encoding-regexp-match
# for more info

module Rack::Utils
  def escape(s)
    CGI.escape(s.to_s)
  end
end