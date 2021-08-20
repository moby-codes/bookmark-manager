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
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com/', 'MA');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy All software');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');")

    visit '/bookmarks'
    expect(page).to have_content 'MA'
    expect(page).to have_content 'Destroy All software'
    expect(page).to have_content 'google'
  end

  scenario 'the user should be able to click on title to naviagte to website' do
    visit '/bookmarks'
    click_link 'MA'
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

    scenario 'The user should be able to add a title for the bookmark' do
      visit '/'
      click_button 'Add bookmark'
      fill_in('title', with: 'google')
      click_button 'Save'
      click_button 'View Bookmarks'
      expect(page).to have_content('google')
    end

  end
    
end
