class Item < ApplicationRecord
  belongs_to :user
  #  belongs_to :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :prefecture
  belongs_to :status

 with_options presence: true do
  validates :name
  validates :description
  validates :image
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
 end

 with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
  validates :status_id
  validates :category_id
  validates :delivery_charge_id
  validates :delivery_day_id
  validates :prefecture_id
 end
end
