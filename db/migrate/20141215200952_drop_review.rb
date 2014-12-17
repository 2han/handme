class DropReview < ActiveRecord::Migration
  def change
    drop_table :reviews
  end
end
