class AddRememberTokenToWriters < ActiveRecord::Migration
  def change
  	add_column :writers, :remember_token, :string
    add_index  :writers, :remember_token
  end
end
