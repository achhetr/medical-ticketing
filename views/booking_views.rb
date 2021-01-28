require_relative './base_views'

class BookingViews < BaseViews
  def list_arr(arr)
    arr.each_with_index do |item, index|
      puts "#{index + 1}. PATIENT NAME - #{item[:patient]} | DOCTOR - #{item[:doctor]} | STAFF BOOKED - #{item[:staff]} | WAITING"
    end
  end
end