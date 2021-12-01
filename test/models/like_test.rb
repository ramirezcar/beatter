# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  track_id   :integer
#  user_id    :integer          not null
#
# Indexes
#
#  index_likes_on_post_id   (post_id)
#  index_likes_on_track_id  (track_id)
#  index_likes_on_user_id   (user_id)
#
# Foreign Keys
#
#  post_id   (post_id => posts.id)
#  track_id  (track_id => tracks.id)
#  user_id   (user_id => users.id)
#
require "test_helper"

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
