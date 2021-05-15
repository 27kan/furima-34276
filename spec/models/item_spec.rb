require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規投稿（#create)' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '正常系テスト' do
      it '必要な情報があれば登録ができる' do
        expect(@item).to be_valid
      end
    end
    context '異常系テスト' do
      it '出品画像が空では保存ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では保存ができない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が空では保存ができない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'カテゴリーが空では保存ができない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'カテゴリーが「0」では保存ができない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 0'
      end
      it '商品の状態が空では保存ができない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item status can't be blank"
      end
      it '商品の状態が「0」では保存ができない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item status must be other than 0'
      end
      it '配送料の負担が空では保存ができない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping can't be blank"
      end
      it '配送料の負担が「0」では保存ができない' do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping must be other than 0'
      end
      it '発送元の地域が空では保存ができない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '発送元の地域が「0」では保存ができない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area must be other than 0'
      end
      it '発送までの日数が空では保存ができない' do
        @item.schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Schedule can't be blank"
      end
      it '発送までの日数が「0」では保存ができない' do
        @item.schedule_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Schedule must be other than 0'
      end
      it '価格が空では保存ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が299以下では保存ができない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters. 300 ~ 9,999,999'
      end
      it '価格が10000000では保存ができない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters. 300 ~ 9,999,999'
      end
      it '価格が全角文字では保存ができない' do
        @item.price = '全角文字'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters. 300 ~ 9,999,999'
      end
      it '価格が半角英字では保存ができない' do
        @item.price = 'hankaku'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters. 300 ~ 9,999,999'
      end
      it '価格が半角英数字混合では保存ができない' do
        @item.price = 'kongou1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters. 300 ~ 9,999,999'
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end

# テスト実行コマンド
# bundle exec rspec spec/models/item_spec.rb
