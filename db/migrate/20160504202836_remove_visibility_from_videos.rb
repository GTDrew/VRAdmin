class RemoveVisibilityFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :visibility
  end
end
