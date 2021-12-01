# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :line_items, dependent: :delete_all
  has_many :licences, through: :line_items, dependent: :delete_all

  def sub_total
    sum = 0
    self.line_items.each do |line_item|
      sum += line_item.licence.price unless line_item.licence.price.blank?
    end
    return sum
  end

  def length
    self.line_items.length
  end

end
