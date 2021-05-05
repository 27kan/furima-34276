class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do # 複数のバリデーションを同時に設定する
    validates :nickname
    # 全角ひらがな、カタカナ、漢字のみ許可する
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # カタカナのみ許可する
    validates :last_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :first_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    # format:は、with（正規表現）と属性値がマッチするか
    # マッチしなければ、messageに指定されたエラーメッセージを返す
    validates :birthday
  end
    # passwordの英数字混合正規表現
    validates :password, format: {with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i), message: "is invalid. Input alphabet & numeral characters. "}
  
  has_many :items
end
