class Purchase
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefecture_id, :city, :city2, :bldg, :phone_num, :user_id, :item_id, :token
    

# ex
#  numericality: { other_than: 0, message: 'Select' } 
#addressモデル バリデーション
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :city2
    validates :phone_num, format: {with: /\A\d{10,11}\z/}
  end
#orderモデル　バリデーション
  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      city2: city2, 
      bldg: bldg, 
      phone_num: phone_num, 
      order_id: order.id
    )

  end

end