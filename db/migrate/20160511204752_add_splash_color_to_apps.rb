class AddSplashColorToApps < ActiveRecord::Migration
  def change
  	add_column :apps, :splash_color, :string
  end
end
