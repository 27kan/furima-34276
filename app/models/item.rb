class Item < ApplicationRecord
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping
  belongs_to :area
  belongs_to :schedule

  belongs_to :user
end
