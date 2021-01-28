require_relative './base_controller'
require_relative '../views/staff_views'

class StaffController < BaseController
  def initialize(staff_repository)
    super(staff_repository)
    @staff_views = StaffViews.new
  end

  # list staff
  def list
    @staff_views.display("STAFF")
    if empty?
      @staff_views.display("EMPTY!!!!!!!")
    else
      staff_arr = @element_repository.all
      @staff_views.list_arr(staff_arr)
    end
  end

  # create
  def create
    # get staff information
    # create staff instance
    staff = Staff.new(staff_info)
    # add to repository and save in csv
    @element_repository.create(staff)
    @staff_views.display("SUCCESSFULLY CREATED STAFF RECORD")
  end

  # delete
  def delete
    # list all staff
    list
    unless empty?
      # get input from user about the list selection
      index = @staff_views.user_input('Please enter index number for staff').to_i - 1

      # delete value
      @element_repository.delete!(id)
    end
  end

  private

  def staff_info
    staff = {}
    #view gets user input for name
    staff[:name] = @staff_views.user_input("Please enter name:")
    #view gets user input for age
    staff[:age] = @staff_views.user_input("Please enter age:").to_i
    #view gets user input for mobile
    staff[:mobile] = @staff_views.user_input("Please enter mobile:") 
    staff
  end

  # update
  def update; end
end