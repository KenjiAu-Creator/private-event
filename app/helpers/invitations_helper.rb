module InvitationsHelper
  def signed_up?
    # Check for events in attended events
    # Check for event id in each element
    # If not in the array then return false
    # Else return true
    current_user.attended_events
    return false
  end
end
