require_relative 'person'

class Doctor < Person
  def self.csv_headers
    %w[id name age mobile role]
  end
end