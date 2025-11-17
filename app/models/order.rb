class Order < ApplicationRecord
  has_many :line_item, destroy_dependent: true
end
