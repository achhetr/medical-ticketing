require_relative './base_repository'
require_relative '../models/manager'

class ManagerRepository < BaseRepository

  private
  def delete!(id); end

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:age] = row[:age].to_i
      @elements << Manager.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end