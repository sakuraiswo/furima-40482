class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge_burden
  belongs_to :prefecture
  belongs_to :number_of_day
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :introduction, presence: true, length: { maximum: 1000 }
  validates :category_id, :condition_id, :delivery_charge_burden_id, :prefecture_id, :number_of_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be between ¥300 and ¥9,999,999 and consist of digits only' }
end
