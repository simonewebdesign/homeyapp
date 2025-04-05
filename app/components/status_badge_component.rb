class StatusBadgeComponent < ViewComponent::Base
  def initialize(status:)
    @status = status
  end
end
