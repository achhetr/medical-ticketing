class BaseController
  def initialize(repository)
    @element_repository = repository
  end
  # list of patient is empty
  def empty?
    @element_repository.all.empty?
  end
end