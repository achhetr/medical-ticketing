require_relative './base_repository'
require_relative '../models/booking'

class BookingRepository < BaseRepository

  private

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Booking.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end