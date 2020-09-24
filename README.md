# テーブル設計

## admin テーブル

| Column   | Type   | Options                  |
| -------- | ------ | ------------------------ |
| email    | string | null: false, unique:true |
| password | string | null: false, unique:true |

## customer テーブル

| Column           | Type    | Options                  |
| ---------------- | ------- | ------------------------ |
| email            | string  | null: false              |
| password         | string  | null: false, unique:true |
| is_active        | boolean | null: false              |
| first_name       | string  | null: false              |
| first_name_kana  | string  | null: false              |
| family_name      | string  | null: false              |
| family_name_kana | string  | null: false              |
| post_code        | string  | null: false              |
| address          | string  | null: false              |
| tel              | string  | null: false, unique:true |

### Association

- has_many :cart_items
- has_many :products, through: :cart_items
- has_many :orders
- has_many :addresses


## address テーブル

| Column      | Type    | Options           |
| ----------- | ------- | ----------------- |
| customer_id | integer | foreign_key: true |
| post_code   | string  | null: false       |
| addressee   | string  | null: false       |
| address     | string  | null: false       |

### Association

- belongs_to :customer

## cart_item

| Column      | Type    | Options           |
| ----------- | ------- | ----------------- |
| product_id  | integer | foreign_key: true |
| customer_id | integer | foreign_key: true |
| quantity    | integer | null: false       |


### Association
- belongs_to :customer
- belongs_to :product

## genres テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| validity | boolean | null: false |

### Association

- has_many :products

## order_item テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| product_id  | integer | null: false |
| order_id    | integer | null: false |
| quantity    | integer | null: false |
| order_price | integer | null: false |
| make_status | integer | null: false |

### Association

- belongs_to :order
- belongs_to :product


## order テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| customer_id     | integer | foreign_key: true |
| addressee       | string  | null: false       |
| post_code       | string  | null: false       |
| send_to_address | string  | null: false       |
| how_to_pay      | boolean | null: false       |
| deliver_fee     | integer | null: false       |
| order_status    | integer | null: false       |

### Association

- belongs_to :customer
- has_many :order_items, dependent: :destroy
- has_many :products, :through => :order_items
- belongs_to :customer

## product テーブル

| Column       | Type    | Options           |
| ------------ | ------- | ----------------- |
| genre_id     | integer | foreign_key: true |
| name         | string  | null: false       |
| introduction | text    | null: false       |
| status       | boolean | null: false       |
| image_id     | string  | null: false       |
| price        | integer | null: false       |

### Association

- belongs_to :genre
- has_many :cart_items
- has_many :customers, through: :cart_items
- has_many :order_items
- has_many :products, through: :order_items
- attachment :image