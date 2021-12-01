# json.array! @notifications do |notification|
#   json.recipient notification.recipient
#   json.actor notification.actor
#   json.action notification.action
#   json.notifiable do #notification.notifiable
#     json.type "a #{notification.notifiable.class.to_s.humanize.underscore}"
#   end
#   json.url post_path(notification.notifiable, anchor: dom_id(notification.notifiable))
# end