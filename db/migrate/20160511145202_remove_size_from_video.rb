class RemoveSizeFromVideo < ActiveRecord::Migration
  def change
    remove_column :videos, :size
  end
end
