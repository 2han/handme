class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :status
      t.integer :fee
      t.integer :user_id
      t.string :title
      t.text :introduction
      t.datetime :deadline
      t.string :place

      t.timestamps
    end
  end
end
