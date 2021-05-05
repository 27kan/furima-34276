class Item < ApplicationRecord
  with_options presence: true do
    validates :name, :info, :price
    validates :category_id,
              :item_status_id,
              :shipping_id,
              :area_id,
              :schedule_id,
                numericality:{ other_than: 0 }
    validates :image
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
end
