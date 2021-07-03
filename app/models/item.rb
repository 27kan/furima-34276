class Item < ApplicationRecord
  with_options presence: true do
    validates :name, :info
    validates :category_id,
              :item_status_id,
              :shipping_id,
              :area_id,
              :schedule_id,
              numericality: { other_than: 0 }
    validates :image
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000,
                              message: 'is invalid. Input half-width characters. 300 ~ 9,999,999' }
  end

  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping
  belongs_to :area
  belongs_to :schedule

  has_one_attached :image
  belongs_to :user
  has_one :order

  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  
end
