class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :icon
      t.string :header_image
      t.string :splash_image
      t.string :background_color
      t.string :font_color
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
