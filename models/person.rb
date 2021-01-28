class Person  
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
    @mobile = attributes[:mobile]
    @role = attributes[:role]
  end

  def to_array
    [@id, @name, @age, @mobile, @role]
  end

  def doctor?
    @role == 'doctor'
  end

  def staff?
    @role == 'staff'
  end

  def patient?
    @role == 'patient'
  end

  def manager?
    @role == 'manager'
  end
    
end