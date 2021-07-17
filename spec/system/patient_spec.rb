require 'rails_helper'
RSpec.feature "Patient management function", type: :feature do
  background do
    User.create!( email: 'esther@gmail.Com',  password: '123456', password_confirmation:'123456')
    visit new_user_session_path
    fill_in 'Email', with: 'esther@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    
    Patient.create(patient_name:'esther', description:'happiness comes', image:'estherwanjuli@gmail.com')
  end
  scenario "Test description list" do
    
    visit patients_path
  
  end

  scenario "Test Patient creation" do
    Patient.create(patient_name:'esther', description:'happiness comes', image:'estherwanjuli@gmail.com')
  end

  scenario "Test Patient details" do
    Patient.first
   
  end

  scenario "Test Patient updating" do
    click_on 'Edit'

    patient=Patient.create(patient_name:'esther', description:'happiness comes', image:'estherwanjuli@gmail.com')
    
    patient.patient_name='esther2'
    patient.save
   # save_and_open_page
   
  end
  scenario 'Test Patient Deletion' do
    patient2=Patient.create(patient_name:'esther', description:'happiness comes', image:'estherwanjuli@gmail.com')
    patient2.delete
   
    visit patients_path
    
  end
  scenario 'Test Patient validation' do
    Patient.create(patient_name:'esther', description:'happiness comes', image:'estherwanjuli@gmail.com')
    visit patients_path
       
  end
  
  

end