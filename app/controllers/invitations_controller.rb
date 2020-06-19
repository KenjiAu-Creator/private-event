class InvitationsController < ApplicationController
  include InvitationsHelper
  def new 
    @invitation = Invitiation.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])

    if !signed_up?
      # Code to save the event into both the event model and the user model
      # as attended_event and Attendee
      flash[:success] = "You have signed up for this event!"
      
      # Push the user into the events attendence. The event will know the association through the model.
      @user.attended_events.push(@event)
      # @event.attendees.push(@user)
    else
      flash[:error] = "You are already signed up for this event"
    end

    redirect_to @event
  end
end
