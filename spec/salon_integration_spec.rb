require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('displays home page') do
    visit('/')
    expect(page).to have_content("Welcome!")
  end
end
