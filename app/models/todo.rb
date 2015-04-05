class Todo < ActiveRecord::Base
  validates :text, presence: true
  validates :done, inclusion: {in: [true, false]}
end
