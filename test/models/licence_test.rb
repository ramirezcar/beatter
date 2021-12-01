# == Schema Information
#
# Table name: licences
#
#  id              :integer          not null, primary key
#  file_url        :string
#  price           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  licence_name_id :integer
#  track_id        :integer
#
# Indexes
#
#  index_licences_on_licence_name_id  (licence_name_id)
#  index_licences_on_track_id         (track_id)
#
# Foreign Keys
#
#  licence_name_id  (licence_name_id => licence_names.id)
#  track_id         (track_id => tracks.id)
#
require "test_helper"

class LicenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
