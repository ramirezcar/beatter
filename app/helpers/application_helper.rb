module ApplicationHelper
  def number_to_clp(amount)
    number_to_currency(amount, :unit => 'CLP', :precision => 0, :separator => ",", :delimiter => ".")
  end
end
