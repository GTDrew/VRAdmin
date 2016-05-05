class ChangeVideoFormatToEnum < ActiveRecord::Migration
  def change
    remove_column :videos, :format
    add_column    :videos, :format, :integer, default: 0
  end
end
