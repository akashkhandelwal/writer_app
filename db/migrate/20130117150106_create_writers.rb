class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :screen_name
      t.string :gender

      t.timestamps
    end
  end
end
