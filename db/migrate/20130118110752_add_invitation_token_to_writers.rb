class AddInvitationTokenToWriters < ActiveRecord::Migration
  def change
    add_column :writers, :invitation_token, :string
  end
end
