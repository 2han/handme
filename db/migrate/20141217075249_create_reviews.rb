class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewing_id
      t.integer :reviewed_id
      t.text :text
      t.integer :scare

      t.timestamps
    end
  end
end
