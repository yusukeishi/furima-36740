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

  validates :name, presence: true
  validates :description, presence: true
  validates :status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
end
