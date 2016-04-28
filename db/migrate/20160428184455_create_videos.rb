class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string  :name, null: false
      t.string  :description
      t.string  :thumbnail
      t.string  :video_file, null: false
      t.boolean :format, default: true, null: false
      t.boolean :visibility, default: true, null: false
      t.belongs_to :app, index: true

      t.timestamps null: false
    end
  end
end
