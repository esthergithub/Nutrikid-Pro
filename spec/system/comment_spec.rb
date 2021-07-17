require 'rails_helper'
RSpec.feature "Comment management function", type: :feature do
  background do
    User.create!( email: 'esther@gmail.Com',  password: '123456', password_confirmation:'123456')
    visit new_user_session_path
    fill_in 'Email', with: 'esther@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    
    Comment.create(content:"hello world" )
  end
  scenario "Test description list" do
    
    visit patients_path
  
  end

  scenario "Test Comment creation" do
    Comment.create(content:"hello world" )
  end

  scenario "Test Comment details" do
    Patient.first
   
  end

  
  scenario 'Test Comment Deletion' do
    patient2=Comment.create(content:"hello world" )
    patient2.delete
   
    visit patients_path
    
  end
  scenario 'Test Comment validation' do
    Comment.create(content:"hello world" )
    visit patients_path    
  end
  
  

end