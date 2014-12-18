class Job < ActiveRecord::Base
  acts_as_taggable # acts_as_taggable_on :tags のエイリアス
  acts_as_taggable_on :skills, :interests
  belongs_to :user
  has_many :applies
  default_scope -> { order('created_at DESC') }
end
