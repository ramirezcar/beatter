class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient_id: current_user).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient_id: current_user).unread
    @notifications.update_all(read_at: Time.now)
  end
end