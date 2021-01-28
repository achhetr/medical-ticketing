require_relative './booking_controller'
require_relative '../views/history_views'
require_relative '../models/history'

class HistoryController < BaseController
    def examine(id)
      element = @element_repository.find(id)
      element.booking!
      @element_repository.update!(id, element)
    end
end