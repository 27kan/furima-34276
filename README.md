# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_reading     | string  | null: false |
| first_reading    | string  | null: false |
| birthday         | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | ----       | ActiveStorage                  |
| item_name       | string     | null: false                    |
| item_info       | text       | null: false                    |
| category_id     | integer    | ActiveHash                     |
| item_status_id  | integer    | ActiveHash                     |
| shipping_id     | integer    | ActiveHash                     |
| area_id         | integer    | ActiveHash                     |
| schedule_id     | integer    | ActiveHash                     |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefecture_id   | integer    | ActiveHash                     |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
