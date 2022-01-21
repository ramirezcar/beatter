json.array! @notifications do |notification|
  json.id notification.id
  # json.recipient notification.recipient
  json.actor notification.actor.aka
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "a #{notification.notifiable.class.to_s.humanize.downcase}"
  end
  json.id notification.id
  # json.url post_path(notification.notifiable)
end