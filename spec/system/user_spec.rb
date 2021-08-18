require 'rails_helper'
RSpec.describe 'User management function', type: :system do
describe 'Sign_up users function' do
    context 'When user create a patient' do
    it 'User Should Sign_up for patient crate page' do
    visit new_user_registration_path
    fill_in 'Email', with:  'tess1@gmail.com'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation',  with: 'password1'
    click_button 'Sign up'
    expect(page).to have_content 'アカウント登録が完了しました。'
  end
end
end
describe 'Session functionality test' do
    before do
      User.create(email: 'test1@gmail.com',
                  password: 'password',
                  password_confirmation: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'test1@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      @user = User.first
    end
    context 'to be able to login' do
      it 'enables login' do
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'to be able to logout' do
      it 'enables logout' do
        click_on "Logout"
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end

end