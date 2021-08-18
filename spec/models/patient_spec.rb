require 'rails_helper'

RSpec.describe Patient, type: :model do

  it "Validation does not pass if the name is empty" do
    patient = Patient.new(patient_name: '', description: 'Failure test')
    expect( patient).not_to be_valid
  end

  it "Validation does not pass if description is empty" do
    patient = Patient.new(patient_name: 'Failure test', description: '')
    expect( patient).not_to be_valid
  end

  it "validation passes If description is described in name and description" do
    patient=Patient.new(patient_name:'True',description:'True')
  end
end