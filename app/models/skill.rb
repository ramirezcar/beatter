# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  body       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_skills_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Skill < ApplicationRecord
    belongs_to :user

    has_rich_text :body
end
