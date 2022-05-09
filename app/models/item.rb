class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee
  belongs_to :prefecture

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
  end

  with_options numericality: { other_than: 1, messege: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :scheduled_delivery_id
    validates :prefecture_id
  end

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
