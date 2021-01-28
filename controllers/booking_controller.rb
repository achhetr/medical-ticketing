require_relative './base_controller'
require_relative '../views/booking_views'
require_relative '../models/booking'

class BookingController < BaseController
  def initialize(attributes = {})
    super(attributes[:booking_repository])
    @patient_repository = attributes[:patient_repository]
    @staff_repository = attributes[:staff_repository]
    # @history_repository = attributes[:history_repository]
    @booking_views = BookingViews.new
  end

  def create
    booking_hash = {}
    # view get list of patient
    patient_arr = @patient_repository.all
    patient_index = @booking_views.list_arr(patient_arr).to_i - 1
    # get patient selection
    booking_hash[:patient] = patient_arr[patient_index].id

    # view get list of staff
    staff_arr = @staff_repository.all
    staff_index = @booking_views.list_arr(staff_arr).to_i - 1
    # get staff selection
    booking_hash[:staff] = staff_arr[staff_index].id

    # view get list of doctor
    doctor_arr = @doctor_repository.all
    doctor_index = @booking_views.list_arr(doctor_arr).to_i - 1
    # select doctor
    booking_hash[:doctor] = doctor_arr[doctor_index].id
    
    # book patient
    booking_info = Booking.new(booking_hash)

    @element_repository.create(booking_info)
    # @history_repository.create(booking_info)
  end

  # list booking
  def list
    @booking_views.display("Booking")
    if empty?
      @booking_views.display("EMPTY!!!!!!!")
    else
      doctor_arr = @element_repository.all
      @booking_views.list_arr(doctor_arr)
    end
  end

  # getting id
  def examine
    # list all bookings
    list
    
    if empty?
      @booking_views.display("No Booking")
    else
      id = @booking_views.user_input(prompt)
      @element_repository.delete!(id) 
    end
    # @history_repository.examine(id)
  end
end