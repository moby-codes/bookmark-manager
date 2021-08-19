# frozen_string_literal: true

feature 'users can view the home page' do
  scenario 'expects user to see -welcome to your bookmarks!-' do
    visit('/')
    expect(page).to have_content 'Welcome to your bookmarks!'
  end
end

feature 'user can click link to their bookmarks' do
  scenario 'user to see a list of their bookmarks' do
    visit '/'
    click_button('View')
    expect(page).not_to have_content 'Welcome to your bookmarks!'
    expect(page).to have_content 'See your list of bookmarks below'
  end

  scenario 'user should be able to see all bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit '/bookmarks'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com/'
  end

  feature 'So the user can add a new bookmark' do
    scenario 'I would like to view an add button' do      
      visit '/'
      expect(page).to have_button('Add bookmark')
    end
    
    scenario 'after I click add bookmark, I should be allowed to enter a bookmark' do
      visit '/'
      click_button 'Add bookmark'
      expect(page).to have_field('add_bookmark')
    end

    scenario 'After adding a new bookmark, i should be able to view the new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('www.yahoo.com');")
      visit '/'
      click_button 'Add bookmark'
      fill_in('add_bookmark', with: 'www.yahoo.com')
      click_button 'Save'
      click_button 'View Bookmarks'
      expect(page).to have_content('www.yahoo.com')
    end

  end
    
end
