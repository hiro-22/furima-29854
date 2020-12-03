class Purchase
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefecture_id, :city, :city2, :bldg, :phone_num, :user_id, :item_id
    


#addressモデル バリデーション
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :city2
    validates :phone_num
  end

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