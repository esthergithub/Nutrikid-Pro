require 'rails_helper'
RSpec.feature "Comment management function", type: :feature do
  background do
    User.create!( email: 'esther@gmail.Com',  password: '123456', password_confirmation:'123456')
    visit new_user_session_path
    fill_in 'Email', with: 'esther@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    
    Category.create(name:"hello world", description:"happiness comes within us")
  end
  scenario "Test description list" do
    
    visit categories_path
  
  end

  scenario "Test Category creation" do
   Category.create(name:"hello world" , description:"happiness comes within us" )
  end

  scenario "Test Category details" do
    Category.first
   
  end

  
  scenario 'Test Category Deletion' do
    patient2=Category.create(name:"hello world", description:"happiness comes within us")
    patient2.delete
   
    visit categories_path
    
  end
  scenario 'Test Comment validation' do
    Category.create(name:"hello world", description:"happiness comes within us" )
    visit categories_path
    
      
      
  end
  
  

end