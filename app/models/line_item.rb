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
class LineItem < ApplicationRecord
  belongs_to :licence
  belongs_to :cart

  # has_one :cart, dependent: :destroy
  has_many :sale, dependent: :delete_all

  def total_price
    self.licence.price
  end
end
