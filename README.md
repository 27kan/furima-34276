# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_reading       | string  | null: false               |
| first_reading      | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| info            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| item_status_id  | integer    | null: false                    |
| shipping_id     | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| schedule_id     | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| area_id         | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone           | string     | null: false                    | 
| order           | references | null: false, foreign_key: true |
### Association

- belongs_to :order
