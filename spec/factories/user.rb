FactoryBot.define do
  factory :user do
    name { 'test_name' }
    email { 'test_email' }
    password {'test_password'}
   # password_comfirmation {'test_password_confirmation'}
   # admin {'admin_status'}
  end
end