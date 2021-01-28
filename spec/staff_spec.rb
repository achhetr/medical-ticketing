require_relative '../models/staff.rb'

describe Staff do
  staff = Staff.new(name: "Akash", age: 31, mobile: "0450923182")
  it "should initialize staff instance" do
    expect(staff.class).to eq(Staff)
  end
end