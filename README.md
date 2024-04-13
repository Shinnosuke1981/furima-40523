# テーブル設計
## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name_kanji     | string | null: false               |
| first_name_kanji    | string | null: false               |
| last_name_katakana  | string | null: false               |
| first_name_katakana | string | null: false               |

### Association

 - has_many :items
 - has_many :orders
 - has_many :shipping_addresses

## items テーブル

| Column                      | Type       | Options                  |
| --------------------------- | ---------- | ------------------------ |
| title                       | string     | null: false              |
| item_price                  | integer    | null: false              |
| shipping_fee_responsibility | string     | null: false              |
| comment                     | text       | null: false              |
| user                        | references | null: false, foreign_key |
| item_category               | string     | null: false              |
| item_condition              | string     | null: false              |
| shipping_origin             | string     | null: false              |
| estimated_shipping_date     | string     | null: false              |

### Association

 - belongs_to :user
 - has_one :order

## orders テーブル

| Column           | Type       | Options                  |
| ---------------- | ---------- | ------------------------ |
| user             | references | null: false, foreign_key |
| item             | references | null: false, foreign_key |
| purchase_date    | string     | null: false              |
| order_item_price | datetime   | null: false              |

### Association        

 - belongs_to :user
 - belongs_to :item
 - belongs_to :item

## addresses テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_code   | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| street_number | string | null: false | 
| build_name    | string | |
| phone_number  | string | null: false | 

### Association
 - belongs_to :user
 - has_many :order









