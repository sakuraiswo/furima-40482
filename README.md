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
| birthday           |  date  | null: false |

### Association

- has_many :items
- has_many :purchase_record


## items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| item_name         | string  | null: false |
| introduction      | text    | null: false |
| category_id       | integer | null: false |
| condition_id      | integer | null: false |
| delivery_charge_burden_id | integer | null: false |
| prefecture_id     | integer | null: false |
| number_of_days_id | integer | null: false |
| price             | integer | null: false |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record
- has_one_attached :image


## buyers テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| post_code       | string   | null: false |
| prefecture_id   | integer  | null: false |
| city            | string   | null: false |
| street_address  | string   | null: false |
| building        | string   |
| phone_number    | string   | null: false |
| purchase_record_id | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record
- belongs_to :user, through: :purchase_record
- belongs_to :item, through: :purchase_record


## purchase_record テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer