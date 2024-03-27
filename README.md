# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :buyers


## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| item_name       | string    | null: false |
| introduction    | text    | null: false |
| category        | string  | null: false |
| condition       | string  | null: false |
| delivery_charge_burden | string | null: false |
| shipping_source_place  | string | null: false |
| number_of_days  | string  | null: false |
| price           | integer | null: false |
| sale_status     | string  | null: false |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer
- has_one_attached :image


## buyers テーブル

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| card_token   | string   | null: false |
| post_code    | string   | null: false |
| prefecture   | string   | null: false |
| city         | string   | null: false |
| address      | string   | null: false |
| building     | string   | null: false |
| phone_number | integer  | null: false |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item