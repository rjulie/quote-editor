class LineItem < ApplicationRecord
  belongs_to :line_item_date

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  delegate :quote, to: :line_item_date
  # delegate the quote method to the LineItem#line_item_date method
  # line_item.line_item_date.quote
  # is equivalent to
  # line_item.quote

  def total_price
    quantity * unit_price
  end
end
