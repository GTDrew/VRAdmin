class AddCodeToApp < ActiveRecord::Migration
  def change
  	add_column :apps, :code, :string, :limit => 5
  end
end
