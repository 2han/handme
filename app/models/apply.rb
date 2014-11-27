class Apply < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  has_many :message
end
