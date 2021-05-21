require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id )
      sleep(0.2)
    end
    
    context '正常系テスト' do
      it '必要な情報があれば登録ができる' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも登録ができる' do
        @order_address.building_name = " "
        expect(@order_address).to be_valid
      end
    end
    context '異常系テスト' do
      it '郵便番号が空では保存ができない' do
      @order_address.postal_code = " "
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号にハイフンが入っていないと保存ができない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '郵便番号が3桁-4桁でなければ保存ができない' do
        @order_address.postal_code = "1234-567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '都道府県が空では保存ができない' do
      @order_address.area_id = " "
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include "Area can't be blank"
      end
      it '都道府県が[0]では保存ができない' do
        @order_address.area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area must be other than 0"
      end
      it '市区町村が空では保存ができない' do
        @order_address.city = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では保存ができない' do
        @order_address.house_number = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号が空では保存ができない' do
        @order_address.phone = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone can't be blank"
      end
      it '電話番号が半角英字では保存ができない' do
        @order_address.phone = "hankaku"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid. Only integer"
      end
      it '電話番号が半角英数字混合では保存ができない' do
        @order_address.phone = "eisu123"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid. Only integer"
      end
      it '電話番号が全角文字では保存ができない' do
        @order_address.phone = "全角文字"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid. Only integer"
      end
      it '電話番号が12桁以上では保存ができない' do
        @order_address.phone = "1234567891011"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is too long (maximum is 11 characters)"
      end
      it 'userが紐づいていないと保存ができない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていないと保存ができない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end

# テスト実行コード
# bundle exec rspec spec/models/order_address_spec.rb