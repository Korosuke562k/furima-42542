class BuyAddress
  
  
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_address_id, :city, :street, 
                :building_name, :telephone, :user_id, :item_id, :token
  
# extend ActiveHash::Associations::ActiveRecordExtensions
# belongs_to_active_hash :shipping_address

  with_options presence: true do 
    validates :shipping_address_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}/, message: "is valid. Include hyphen(-)" }
    validates :token, :city, :street, :user_id, :item_id, presence: true
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "must be 10 or 11 digit Half-width numbers"} 
  end

  def save 
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipping_address_id: shipping_address_id, city: city, street: street, 
                   building_name: building_name, telephone: telephone, buy: buy )
  end
end