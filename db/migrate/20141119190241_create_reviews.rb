class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :score

      t.timestamps
    end
  end
end
