class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street_address, :building, :phone_number,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format 123-4567.' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must contain only half-width numbers.' }
    validates :user_id, :item_id, :city, :street_address
    validates :token, presence: { message: 'error. Card has incorrect information' }
  end

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, city:, street_address:,
                   building:, phone_number:, purchase_id: purchase.id)
  end
end
