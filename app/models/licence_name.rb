# == Schema Information
#
# Table name: licence_names
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LicenceName < ApplicationRecord

    has_many :licences
end
