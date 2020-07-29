class ChangeFieldsToInvite < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :attendee_id, :integer
    add_column :invitations, :attended_event_id, :integer
    # remove_column :invitations, :answer

    add_column :invitations, :answer, :boolean
    remove_column :invitations, :guest_id
    remove_column :invitations, :host_id
  end
end
