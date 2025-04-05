class Project < ApplicationRecord
  audited only: :status
  validates :name, presence: true, uniqueness: true
  enum :status, {
         not_started: "not_started",
         in_progress: "in_progress",
         done: "done",
       },
       default: :not_started,
       validate: true
end
