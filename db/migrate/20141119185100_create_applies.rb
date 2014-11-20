class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :status

      t.timestamps
    end
  end
end
