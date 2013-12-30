class Point < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :activity, presence: true
end
