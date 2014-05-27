class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price_in_cents
    product.price_in_cents * quantity
  end
end
