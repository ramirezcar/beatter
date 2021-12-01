# == Schema Information
#
# Table name: sales
#
#  id           :integer          not null, primary key
#  buy_order    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  line_item_id :integer
#
# Indexes
#
#  index_sales_on_line_item_id  (line_item_id)
#
# Foreign Keys
#
#  line_item_id  (line_item_id => line_items.id)
#
class Sale < ApplicationRecord
    
    has_one :licence

end
