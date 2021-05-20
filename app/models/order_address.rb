class OrderAddress
    # Formオブジェクトの機能を持たせるため
    include ActiveModel::Model
    # 保存したいカラム名を属性値として扱えるように
    # order_idは必要かわからないから必要なら後で付け足す
    attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :house_number, :building_name, :phone

    with_options presence: true do
        validates :user_id, :item_id, :city, :house_number
        validates :phone, numericality: {only_integer: true, message: 'is invalid. Only integer'}, length: {maximum: 11}
        validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
        validates :area_id, numericality: {other_than: 0 }
    end
    
    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        Address.create(postal_code: postal_code, area_id: area_id, city: city,
                        house_number: house_number, building_name: building_name,
                        phone: phone, order_id: order.id)
    end
end
