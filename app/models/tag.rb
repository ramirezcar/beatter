# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  desc       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
end
