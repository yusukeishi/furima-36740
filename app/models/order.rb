class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }

    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)

    BuyerAddress.create(buyer_id: buyer.id, post_number: post_number, prefecture_id: prefecture_id, city: city,
                        building_name: building_name, address: address, phone_number: phone_number)
  end
end
