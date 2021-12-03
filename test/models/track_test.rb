# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  audio_file   :string
#  bpm          :integer
#  img_url      :string
#  tagged_audio :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_tracks_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
