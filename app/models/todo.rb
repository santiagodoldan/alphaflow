class Todo < ApplicationRecord
  has_many :activity_logs, class_name: TodoActivityLog.name

  validates :title, :description, :status, presence: true

  enum status: {
    'In Progress': 0,
    'Done': 1,
    'Invalid': 2
  }
end
