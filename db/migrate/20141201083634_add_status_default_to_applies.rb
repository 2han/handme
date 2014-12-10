class AddStatusDefaultToApplies < ActiveRecord::Migration
  def change
  	change_column :applies, :status, :integer, default: 0
  end
end
