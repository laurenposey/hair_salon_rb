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

describe('add new stylist path', {:type => :feature}) do
  it('lets the user add a stylist to the database') do
    visit('/stylists/new')
    fill_in('name', :with => 'Annette')
    click_button('Add Stylist')
    expect(page).to have_content('Annette')
  end
end

# Question: do I have to keep repeating the add stylist path in order to test these features?

describe('add a client to a stylist path', {:type => :feature}) do
  it('lets the user add a client to a stylist') do
    visit('/stylists/new')
    fill_in('name', :with => 'Annette')
    click_button('Add Stylist')
    expect(page).to have_content('Annette')
    click_link('Annette')
    expect(page).to have_content('Annette')
    fill_in('name', :with => "Grace Hopper")
    click_button('Add Client')
    expect(page).to have_content('Grace Hopper')
  end
end

describe('update a stylist path', {:type => :feature}) do
  it('lets the user update the stylists name') do
    visit('/stylists/new')
    fill_in('name', :with => 'Annette')
    click_button('Add Stylist')
    expect(page).to have_content('Annette')
    click_link('Annette')
    expect(page).to have_content('Update Stylist Information')
    fill_in('name', :with => "April")
    click_button('Update Stylist')
    expect(page).to have_content('April')
  end
end

describe('update a client path', {:type => :feature}) do
  it('lets the user update a client') do
    visit('clients')

  end
end
