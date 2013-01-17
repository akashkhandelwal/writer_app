class AddAdminToWriters < ActiveRecord::Migration
  def change
    add_column :writers, :admin, :boolean, default: false
  end
end
