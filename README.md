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
| birth_date          | date   | null: false               |

### Association

 - has_many :items
 - has_many :orders

## items テーブル

| Column                         | Type       | Options                        |
| ---------------------------    | ---------- | ------------------------------ |
| title                          | string     | null: false                    |
| item_price                     | integer    | null: false                    |
| shipping_fee_responsibility_id | integer    | null: false                    |
| comment                        | text       | null: false                    |
| user                           | references | null: false, foreign_key: true |
| item_category_id               | integer    | null: false                    |
| item_condition_id              | integer    | null: false                    |
| shipping_origin_id             | integer    | null: false                    |
| estimated_shipping_date_id     | integer    | null: false   


### Association

 - belongs_to :user
 - has_one :order

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association        

 - belongs_to :user
 - belongs_to :item
 - has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    | 
| build_name    | string     | |
| phone_number  | string     | null: false                    | 
| order         | references | null: false, foreign_key: true |

### Association
 - belongs_to :order









