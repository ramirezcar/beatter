# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#  licence_id :integer
#
# Indexes
#
#  index_line_items_on_cart_id     (cart_id)
#  index_line_items_on_licence_id  (licence_id)
#
# Foreign Keys
#
#  cart_id     (cart_id => carts.id)
#  licence_id  (licence_id => licences.id)
#
require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
