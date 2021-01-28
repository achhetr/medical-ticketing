require_relative './person'

class Manager < Person
  attr_accessor :id
  
  def self.csv_headers
    %w[id name age mobile role]
  end
end