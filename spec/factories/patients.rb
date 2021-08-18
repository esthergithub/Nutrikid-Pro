FactoryBot.define do
    factory :patient do
  
      patient_name { 'test_patient_name' }
      description {'test_description'}
      rest_image {'test_image'}
    end
  end