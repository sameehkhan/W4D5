require 'spec_helper'
require 'rails_helper'

feature 'Sign Up' do
  background :each do
    visit new_user_path
  end

  scenario 'has a user sign up page' do
    # save_and_open_page
    expect(page).to have_content('Create Account')
  end
  
  scenario 'takes a username and password' do
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end
end 

# scenario 'redirects to the user\'s show page and displays username on success' do
#   fill_in 'username', with: 'harry_potter'
#   fill_in 'Password', with: 'abcdef'
#   save_and_open_page
#   click_button 'Sign Up'
#   expect(page).to have_content('harry_potter')
# 
#   user = User.find_by(username: 'harry_potter')
#   expect(current_path).to eq(user_path(user))
# end