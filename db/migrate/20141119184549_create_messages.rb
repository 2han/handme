class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.text :text
      t.integer :job_id

      t.timestamps
    end
  end
end
