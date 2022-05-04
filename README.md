# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
|nickname            | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |

### Association

- has_many   :items
- has_many   :orders
- belongs_to :birth_date

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name  | string     | null: false                    |
| item_info  | text       | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- belongs_to :category
- belongs_to :sales_status
- belongs_to :shipping_fee
- belongs_to :scheduled_delivery
- belongs_to :prefecture

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false,                   |
| order         | references | nill: false, foreign_key: true |

## Association

- belongs_to :order
- belongs_to :prefecture
