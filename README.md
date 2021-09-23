# テーブル設計

## users テーブル

| Column             | Type        | Options                 |
| ------------------ | ----------- | ----------------------- |
| nickname           | string      | null: false             |
| email              | string      | null: false ,unique:true|
| encrypted_password | string      | null: false             |
| family_name        | string      | null: false             |
| first_name         | string      | null: false             |
| family_name _kana  | string      | null: false             |
| first_name_kana    | string      | null: false             |
| birthday           | data        | null: false             |

### Association

- has_many :buyers
- has_many :items



## items テーブル

| Column              | Type       | Options     |
| ------------------  | ---------- | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |
| status_id           | integer    | null: false |
| category_id         | integer    | null: false |
| delivery_charge_id  | integer    | null: false |
| delivery_day_id     | integer    | null: false |
| delivery_way_id     | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer



## buyers テーブル

| Column              | Type       | Options     |
| ------------------  | ---------- | ----------- |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer



## buyer_addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_number        | string      | null: false |
| prefecture_id      | integer     | null: false |
| city               | string      | null: false |
| address            | string      | null: false |
| building_name      | string      |             |
| phone_number       | string      | null: false |
| buyer              | references  | null: false, foreign_key: true |


### Association

- has_one :buyer
