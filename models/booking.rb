class Booking
  attr_accessor :id, :booking
  attr_reader :staff, :patient, :doctor 

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

  def to_array  
    [@id, @staff, @patient, @doctor, @booking]
  end

  def booking?
    @booking
  end

  def booking!
    @booking = true
  end
end