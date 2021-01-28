require_relative './views/router_views.rb'
class Router
  def initialize(attributes = {})
    @manager_controller = attributes[:manager_controller]
    @staff_controller = attributes[:staff_controller]
    @doctor_controller = attributes[:doctor_controller]
    @patient_controller = attributes[:patient_controller]
    @booking_controller = attributes[:booking_controller]
    # @history_controller = attributes[:history_controller]
    @router_views = RouterView.new
    @stop = false
  end

  def stop!
    @stop = true
  end

  def run_doctor
    choice = @router_views.print_doctor_options
    case choice
    when 1 then @booking_controller.list
    when 2 then @booking_controller.examine
    else stop!
    end
  end

  def run_staff
    choice = @router_views.print_staff_options
    case choice
      when 1 then @patient_controller.create
      when 2 then @patient_controller.list
      when 3 then @patient_controller.delete
      when 4 then @booking_controller.book
      else stop!
    end
  end

  def run_manager
    choice = @router_views.print_manager_options
    case choice
      when 1 then @doctor_controller.create
      when 2 then @doctor_controller.delete
      when 3 then @doctor_controller.list
      when 4 then @staff_controller.create
      when 5 then @staff_controller.delete
      when 6 then @staff_controller.list
      when 7 then @manager_controller.list
    else stop!
    end
  end

  def run
    choice = @router_views.print_start
    until @stop
      # first input for staff, doctor, manager
      case choice
        when 1 then run_doctor
        when 2 then run_staff
        when 3 then run_manager
        else stop!
      end
    end
  end
end