class RouterView

  def print_dash
    puts "#########################################################################"
    puts "#########################################################################"
    puts ""
  end

  def print_welcome
    print_dash
    puts "########################### WELCOME #####################################"
    print_dash
  end

  def exit
    puts "Enter anything to quit"
  end

  def clear
    print `clear`
  end

  def print_start
    print_dash
    puts "Enter 1. if you are a doctor"
    puts "Enter 2. if you are a staff"
    puts "Enter 3. if you are a manager"
    exit
    gets.chomp.to_i
  end

  def print_staff_options
    print_dash
    puts "1. Add new patient"
    puts "2. List all patients"
    puts "3. Delete patient"
    puts "4. Book patient"
    exit
    print "> "
    gets.chomp.to_i
  end

  def print_doctor_options
    print_dash
    puts "1. List booked patient"
    puts "2. Examine patient"
    exit
    print "> "
    gets.chomp.to_i
  end

  def print_manager_options
    print_dash
    puts "1. Add new doctor"
    puts "2. Remove doctor"
    puts "3. List all doctors"
    puts "4. Add new staff"
    puts "5. Remove staff"
    puts "6. List all staff"
    puts "7. List manager"
    puts "8. List manager, staff and doctor"
    exit
    print "> "
    gets.chomp.to_i
  end
end
