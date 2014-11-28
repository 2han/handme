class Job < ActiveRecord::Base
  belongs_to :user
  has_many :applies
  default_scope -> { order('created_at DESC') }
end
