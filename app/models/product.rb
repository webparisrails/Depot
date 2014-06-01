class Product < ActiveRecord::Base
  has_many :line_items
  belongs_to :category
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :category, :presence => true
  #...
  private
# ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
  validates :title, :description, presence: true
  validates :price_in_cents, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with:
          %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
  def self.latest
    Product.order(:updated_at).last
  end
end
