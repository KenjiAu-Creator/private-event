class ChangeFieldsToInvite < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :attendee_id, :integer
    add_column :invitations, :attended_event_id, :integer
    add_column :invitations, :answer, :boolean
  end
end
