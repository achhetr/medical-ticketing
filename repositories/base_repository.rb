require 'csv'
require 'pry-byebug'

class BaseRepository
  def initialize(file_path)
    @file_path = file_path
    @elements = []
    @next_id = 1
    load_csv if File.exists?(@file_path)
  end

  # create element and add into array
  def create(element)
    # binding.pry
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  # get all elements
  def all
    @elements
  end
  
  # find element from id
  def find(id)
    @elements.find { |element| element.id == id}
  end

  # find name from id
  def find_name(id)
    element = @elements.find { |element| element.id == id}
    element.name
  end

  # delete element from the array
  def delete!(id)
    @elements = @elements.reject { |element| element.id == id}
    save_csv
  end

  # update element with new element
  def update!(id, new_element)
    @elements.map! do |element|
      element.id == id ? new_element : element
    end
    save_csv
  end

  private

  # save data into csv
  def save_csv
    CSV.open(@file_path, "wb") do |csv|
      unless @elements.empty?
        csv << @elements.first.class.csv_headers
        @elements.each { |element| csv << element.to_array }
      end
    end
  end
end