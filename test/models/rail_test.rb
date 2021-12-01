# == Schema Information
#
# Table name: rails
#
#  id         :integer          not null, primary key
#  LineItem   :string
#  g          :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer          not null
#  licence_id :integer          not null
#
# Indexes
#
#  index_rails_on_cart_id     (cart_id)
#  index_rails_on_licence_id  (licence_id)
#
# Foreign Keys
#
#  cart_id     (cart_id => carts.id)
#  licence_id  (licence_id => licences.id)
#
require "test_helper"

class RailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
