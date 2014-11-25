class Apply < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  belongs_to :message
end
