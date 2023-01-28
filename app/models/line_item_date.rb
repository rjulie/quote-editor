class LineItemDate < ApplicationRecord
  belongs_to :quote
  has_many :line_items, dependent: :destroy

  # The date must be present on each line item date && A quote won't be able to have the same date twice
  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  def previous_date
    quote.line_item_dates.ordered.where("date < ?", date).last
  end
end
