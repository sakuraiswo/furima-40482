class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge_burden, class_name: 'Delivery_charge_burden'
  belongs_to :prefecture
  belongs_to :number_of_day, class_name: 'Number_of_day'
  belongs_to :user
  has_one_attached :image

  # validates :image, :item_name, :introduction, presence: true
  # validates :category_id,  :condition_id, :delivery_charge_burden_id, :prefecture_id, :number_of_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :price, presence: true, format: { with: /\A\d+\z/, message: 'must consist of digits only' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'must be between ¥300 and ¥9,999,999' }


end
