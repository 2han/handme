class CreateMypages < ActiveRecord::Migration
  def change
    create_table :mypages do |t|

      t.timestamps
    end
  end
end
