class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_address
  belongs_to :buy


  # ActiveHashのIDが「1（未選択）」でないことをチェック
  # validates :shipping_address_id, numericality: { other_than: 1, message: "can't be blank" }

  # 数字3桁、ハイフン、数字4桁の並びのみ許可する
  # validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}/, message: "is valid. Include hyphen(-)" }

end
