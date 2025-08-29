class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category, numericality: { other_than: 1 }
  belongs_to_active_hash :status, numericality: { other_than: 1 }
  belongs_to_active_hash :delivery_fee, numericality: { other_than: 1 }
  belongs_to_active_hash :shipping_address, numericality: { other_than: 1 }
  belongs_to_active_hash :shipping_days, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, :text, presence: true
  validates :amount, presence: true, numericality: { greater_than: 299, less_than: 10_000_000, only_integer: true }

  # ActiveHashのIDが「1（未選択）」でないことをチェック
  validates :category_id, :status_id, :delivery_fee_id, :shipping_address_id, :shipping_days_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
