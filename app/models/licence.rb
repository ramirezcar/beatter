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
class Licence < ApplicationRecord

    belongs_to :track

    has_one :line_item, dependent: :destroy
    has_one :licence_name, dependent: :destroy

    def name
        licence_name_obj = LicenceName.find self.licence_name_id if self.licence_name_id
        return licence_name_obj.name if self.licence_name_id
    end
end
