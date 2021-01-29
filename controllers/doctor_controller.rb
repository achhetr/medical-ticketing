require_relative './base_controller'
require_relative '../views/doctor_views'

class DoctorController < BaseController
  def initialize(doctor_repository)
    super(doctor_repository)
    @doctor_views = DoctorViews.new
  end

  # list doctor
  def list
    @doctor_views.display("doctor")
    if empty?
      @doctor_views.display("EMPTY!!!!!!!")
    else
      doctor_arr = @element_repository.all
      @doctor_views.list_arr(doctor_arr)
    end
  end

  # create
  def create
    # get doctor information
    # create doctor instance
    doctor = Doctor.new(doctor_info)
    # add to repository and save in csv
    @element_repository.create(doctor)
    @doctor_views.display("SUCCESSFULLY CREATED doctor RECORD")
  end

  # delete
  def delete
    # list all doctor
    list
    unless empty?
      # get input from user about the list selection
      index = @doctor_views.user_input('Please enter index number for doctor').to_i - 1
      id = @element_repository.all[index].id
      # delete value
      @element_repository.delete!(id)
    end
  end

  private
  
  def doctor_info
    doctor = {}
    #view gets user input for name
    doctor[:name] = @doctor_views.user_input("Please enter name:")
    #view gets user input for age
    doctor[:age] = @doctor_views.user_input("Please enter age:").to_i
    #view gets user input for mobile
    doctor[:mobile] = @doctor_views.user_input("Please enter mobile:") 
    doctor
  end

  # update
  def update; end
end