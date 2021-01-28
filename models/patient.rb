require_relative 'person'
class Patient < Person
  def self.csv_headers
    %w[id name age mobile role]
  end

  def to_s
    "Name: #{@name} | age: #{@age} | mobile: #{@mobile}"
  end
end