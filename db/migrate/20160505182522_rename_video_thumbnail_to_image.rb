class RenameVideoThumbnailToImage < ActiveRecord::Migration
  def change
    rename_column :videos, :thumbnail, :image
  end
end
