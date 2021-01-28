require_relative '../models/person.rb'

describe Person do
  person = Person.new(name: "Akash", age: 31, mobile: "0450923182")
  it "should match class instance" do
    expect(person.class).to eq(Person)
  end
end