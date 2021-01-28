require_relative '../models/patient.rb'

describe Patient do
  patient = Patient.new(name: "Akash", age: 31, mobile: "0450923182")
  it "should match class instance of a patient" do
    expect(patient.class).to eq(Patient)
  end
end