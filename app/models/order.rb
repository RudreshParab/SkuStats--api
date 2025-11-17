class Order < ApplicationRecord
  validates :external_id, uniqueness: true
  has_many :line_item, dependent: :destroy

  accepts_nested_attributes_for :line_item, allow_destroy: true

  def accepts_nested_attributes_for(order_params)
    order_params.each do |attrs|
      existing = @line_item.find_by(
        sku: attrs[:sku],
        quantity: attrs[:quantity]
      )

      if existing
        @line_item.assign_attributes(attrs)
      else
        @line_item.build(attrs)
      end
    end
  end
end
