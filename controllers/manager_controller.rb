require_relative './base_controller'
require_relative '../views/manager_views'

class ManagerController < BaseController
  def initialize(manager_repository)
    super(manager_repository)
    @manager_views = ManagerViews.new
  end

  # list manager
  def list
    @manager_views.display("MANAGER")
    if empty?
      @manager_views.display("EMPTY!!!!!!!")
    else
      manager_arr = @element_repository.all
      @manager_views.list_arr(manager_arr)
    end
  end

  private

  def manager_info
    manager = {}
    #view gets user input for name
    manager[:name] = @manager_views.user_input("Please enter name:")
    #view gets user input for age
    manager[:age] = @manager_views.user_input("Please enter age:").to_i
    #view gets user input for mobile
    manager[:mobile] = @manager_views.user_input("Please enter mobile:") 
    manager
  end

  # create
  def create; end

  # update
  def update; end

  # delete
  def delete; end
end