class Rename < ActiveRecord::Migration
  def change
    rename_column :reviews, :scare, :score
  end
end
