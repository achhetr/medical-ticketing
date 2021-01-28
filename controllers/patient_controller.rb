require_relative './base_controller'
require_relative '../views/patient_views'

class PatientController < BaseController
  def initialize(patient_repository)
    super(patient_repository)
    @patient_views = PatientViews.new
  end

  # create
  def create
    # get patient information
    # create patient instance
    patient = Patient.new(patient_info)

    ##################################################
    # uncomment below to confirm mobile matching regex
    ##################################################
    # mobile = ""
    # unless /04(\d{8})/.match(mobile) do
    #   prompt = mobile.empty? ? "Please enter mobile:" : "Try again, Please enter mobile:"
    #   mobile = @patient_views(prompt) 
    # end
    # call repo and update 
    ##################################################
    # uncomment above to confirm mobile matching regex
    ##################################################

    # add to repository and save in csv
    @element_repository.create(patient)
    @patient_views.display("SUCCESSFULLY CREATED PATIENT RECORD")
  end

  # list all patients
  def list
    @patient_views.display("PATIENT")
    if empty?
      @patient_views.display("EMPTY!!!!!!!")
    else
      patients_arr = @element_repository.all
      @patient_views.list_arr(patients_arr)
    end
  end

  # update
  def update
    list
    unless empty?
      # get input from user about the list selection
      index = @patient_views.user_input('Please enter index number for patient').to_i - 1
      # get value of user input
      new_patient = patient_info
      # update value in repository
      @element_repository.update!(index, new_patient)
    end
  end

  # delete
  def delete
    # list all patient
    list
    unless empty?
      # get input from user about the list selection
      index = @patient_views.user_input('Please enter index number for patient').to_i - 1
      id = @element_repository.all[index].id
      # delete value
      @element_repository.delete!(id)
    end
  end

  private

  def patient_info
    patient = {}
    #view gets user input for name
    patient[:name] = @patient_views.user_input("Please enter name:")
    #view gets user input for age
    patient[:age] = @patient_views.user_input("Please enter age:").to_i
    #view gets user input for mobile
    patient[:mobile] = @patient_views.user_input("Please enter mobile:") 
    patient
  end
end