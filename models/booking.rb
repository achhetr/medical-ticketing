class Booking
  attr_accessor :id, :booking

  def self.csv_headers
    %w[id staff patient doctor booking]
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @staff = attributes[:staff]
    @patient = attributes[:patient]
    @doctor = attributes[:doctor]
    @booking = attributes[:booking] || false
  end

  def booking?
    @booking
  end

  def booking!
    @booking = true
  end
end