require_relative './base_controller'
require_relative '../views/booking_views'
require_relative '../models/booking'

require 'pry-byebug'

class BookingController < BaseController
  def initialize(attributes = {})
    super(attributes[:booking_repository])
    @patient_repository = attributes[:patient_repository]
    @staff_repository = attributes[:staff_repository]
    @doctor_repository = attributes[:doctor_repository]
    # @history_repository = attributes[:history_repository]
    @booking_views = BookingViews.new
  end

  def book
    booking_hash = {}
    # view get list of patient
    patient_arr = @patient_repository.all
    @booking_views.list_arr(patient_arr)
    patient_index = @booking_views.user_input("Select patient number").to_i - 1

    if patient_index >= patient_arr.length
      @booking_views.display("Wrong selection for patient number")
      return
    end

    # view get list of staff
    staff_arr = @staff_repository.all
    @booking_views.list_arr(staff_arr)
    staff_index = @booking_views.user_input("Select staff number").to_i - 1

    if staff_index >= staff_arr.length
      @booking_views.display("Wrong selection for staff number")
      return
    end

    # view get list of doctor
    doctor_arr = @doctor_repository.all
    @booking_views.list_arr(doctor_arr)
    doctor_index = @booking_views.user_input("Select doctor").to_i - 1
    if doctor_index >= doctor_arr.length
      @booking_views.display("Wrong selection for doctor number")
      return
    end

    # get patient selection
    booking_hash[:patient] = patient_arr[patient_index].id
    # get staff selection
    booking_hash[:staff] = staff_arr[staff_index].id
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
      booking_arr = @element_repository.all
      booking_hashed_arr = booking_arr.map do |booking|
        hash = {}
        hash[:patient] = @patient_repository.find_name(booking.patient)
        hash[:doctor] = @doctor_repository.find_name(booking.doctor)
        hash[:staff] = @staff_repository.find_name(booking.staff) 
        hash
      end
      @booking_views.list_hash_arr(booking_hashed_arr)
    end
  end

  # getting id
  def examine
    # list all bookings
    list
    unless empty?
      id = @booking_views.user_input("Enter patient number to examine").to_i - 1
      id = @element_repository.all[index].id
      @element_repository.delete!(id) 
    end
    # @history_repository.examine(id)
  end
end

