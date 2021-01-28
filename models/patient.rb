require_relative 'person'
class Patient < Person
  def self.csv_headers
    %w[id name age mobile role]
  end
end