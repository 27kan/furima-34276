require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録(#create)' do
    # beforeで@userを作成
    before do
      @user = FactoryBot.build(:user)
    end

    context '正常系テスト' do
      it 'ユーザー新規登録ができること' do
        expect(@user).to be_valid
      end
    end

    context '異常系テスト' do
      it 'emailが空では登録ができない' do
        @user.email  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが重複すると登録できない' do
        @user.save 
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録ができない' do
        @user.password  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが英語のみでは登録ができない' do
        @user.password  = "abcdefg"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Input alphabet & numeral characters. "
      end
      it 'passwordが数字のみでは登録ができない' do
        @user.password  = "1234567"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Input alphabet & numeral characters. "
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'nicknameが空では登録ができない' do
        @user.nickname  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'last_nameが空では登録ができない' do
        @user.last_name  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが半角文字では登録ができない' do
        @user.last_name  = "hankaku"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
      end
      it 'first_nameが空では登録ができない' do
        @user.first_name  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが半角文字では登録ができない' do
        @user.first_name  = "hankaku"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end
      it 'last_readingが空では登録ができない' do
        @user.last_reading  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last reading can't be blank"
      end
      it 'last_readingが半角文字では登録ができない' do
        @user.last_reading  = "hankaku"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last reading is invalid. Input full-width katakana characters."
      end
      it 'last_readingがひらがなでは登録ができない' do
        @user.last_reading  = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last reading is invalid. Input full-width katakana characters."
      end
      it 'last_readingが漢字では登録ができない' do
        @user.last_reading  = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last reading is invalid. Input full-width katakana characters."
      end
      it 'first_readingが空では登録ができない' do
        @user.first_reading  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First reading can't be blank"
      end
      it 'first_readingが半角文字では登録ができない' do
        @user.first_reading  = "hankaku"
        @user.valid?
        expect(@user.errors.full_messages).to include "First reading is invalid. Input full-width katakana characters."
      end
      it 'first_readingがひらがなでは登録ができない' do
        @user.first_reading  = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include "First reading is invalid. Input full-width katakana characters."
      end
      it 'first_readingが漢字では登録ができない' do
        @user.first_reading  = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include "First reading is invalid. Input full-width katakana characters."
      end
      it 'birthdayが空では登録ができない' do
        @user.birthday  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end

# テスト実行コマンド
# bundle exec rspec spec/models/user_spec.rb

# エラーメッセージ
# 全角 is invalid. Input full-width characters.
# カナ is invalid. Input full-width katakana characters.
# パス is invalid. Input alphabet & numeral characters.