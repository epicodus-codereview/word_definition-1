require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to view all words', {:type => :feature}) do
  it('sends the user to the word list') do
    visit('/')
    click_link("See Word List")
    expect(page).to have_content("Words")
  end
end

describe('path to add new word', {:type => :feature}) do
  it('sends user to a form to add a word') do
    visit('/')
    click_link("Add New Word")
    expect(page).to have_content("Add words to your dictionary")
  end
end

describe('path to words form', {:type => :feature}) do
  it('processes user entry and adds a word') do
    visit('/words/new')
    fill_in('name', :with => "simple")
    click_button("Add Word")
    expect(page).to have_content("Success")
  end
end

describe('path to all words', {:type => :feature}) do
  it('sends user to word list') do
    visit('/words/new')
    fill_in('name', :with => "complex")
    click_button("Add Word")
    click_link("See Word List")
    expect(page).to have_content("Words")
  end
end

describe('path to the definitions of a word', {:type => :feature}) do
  it('sends user to list of meanings') do
    visit('/words')
    click_link("simple")
    expect(page).to have_content("Here are all the meanings of this word:")
  end
end

describe('path to word definitions form', {:type => :feature}) do
  it('processes user entry and adds new definition') do
    visit('/words/1')
    click_link("Add a New Definition")
    expect(page).to have_content("Add a definition to")
  end
end

describe('path to success page', {:type => :feature}) do
  it('sends user to success page for adding definition to word') do
    visit('/words/1/definitions/new')
    click_button("Add Definition")
    expect(page).to have_content("Success!")
  end
end

describe('path to index', {:type => :feature}) do
  it('returns user to the main page') do
    visit('/words/1')
    click_link("Return to Main Page")
    expect(page).to have_content("Make Your Own Dictionary")
  end
end
