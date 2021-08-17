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

end
