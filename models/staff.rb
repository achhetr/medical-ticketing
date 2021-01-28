require_relative 'person'

class Staff < Person
  def self.csv_headers
    %w[id name age mobile role]
  end

  
end