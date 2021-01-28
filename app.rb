require 'pry-byebug'

require_relative './router'
require_relative './repositories/patient_repository'
require_relative './controllers/patient_controller'
require_relative './repositories/staff_repository'
require_relative './controllers/staff_controller'
require_relative './repositories/doctor_repository'
require_relative './controllers/doctor_controller'
require_relative './repositories/manager_repository'
require_relative './controllers/manager_controller'
require_relative './repositories/booking_repository'
require_relative './controllers/booking_controller'
require_relative './repositories/history_repository'
require_relative './controllers/history_controller'

# patient 
PATIENT_CSV_FILE_PATH = File.join(__dir__, 'data/patient.csv');
patient_repository = PatientRepository.new(PATIENT_CSV_FILE_PATH)
patient_controller = PatientController.new(patient_repository)

# staff 
STAFF_CSV_FILE_PATH = File.join(__dir__, 'data/staff.csv');
staff_repository = StaffRepository.new(STAFF_CSV_FILE_PATH)
staff_controller = StaffController.new(staff_repository)

# doctor 
DOCTOR_CSV_FILE_PATH = File.join(__dir__, 'data/doctor.csv');
doctor_repository = DoctorRepository.new(DOCTOR_CSV_FILE_PATH)
doctor_controller = DoctorController.new(doctor_repository)

# manager 
MANAGER_CSV_FILE_PATH = File.join(__dir__, 'data/manager.csv');
manager_repository = ManagerRepository.new(MANAGER_CSV_FILE_PATH)
manager_controller = ManagerController.new(manager_repository)

# booking 
BOOKING_CSV_FILE_PATH = File.join(__dir__, 'data/booking.csv');
booking_repository = BookingRepository.new(BOOKING_CSV_FILE_PATH)
all_repository = {
  booking_repository: booking_repository,
  manager_repository: manager_repository,
  staff_repository: staff_repository,
  patient_repository: patient_repository,
  doctor_repository: doctor_repository
}

booking_controller = BookingController.new(all_repository)

# # history 
# HISTORY_CSV_FILE_PATH = File.join(__dir__, 'data/history.csv');
# history_repository = HistoryRepository.new(HISTORY_CSV_FILE_PATH)
# history_controller = HistoryController.new(history_repository)

controllers = {
  patient_controller: patient_controller,
  staff_controller: staff_controller,
  doctor_controller: doctor_controller,
  manager_controller: manager_controller,
  booking_controller: booking_controller
  # history_controller: history_controller
}

# Router
router = Router.new(controllers)
router.run
