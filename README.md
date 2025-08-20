# README

#テーブル設計

## #users テーブル

|  Culumn            | Type    |  Options    |
| ------------------ | ------- | ----------- |
| myoji              | string  | null: false |
| name               | string  | null: false |
| myoji_kana         | string  | null: false |
| mei_kana           | string  | null: false |
| birthday           | date    | null: false |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false |

### Association
- has_many :items
- has_many :buys


## items テーブル

|  Culumn             | Type       |  Options   |
| ------------------- | ---------- | ---------- |
| name                | string     | null: false |
| text                | text       | null: false |
| category_id         | integer    | null: false, foreign_key: true |
| status_id           | integer    | null: false, foreign_key: true |
| delivery_fee_id     | integer    | null: false, foreign_key: true |
| shipping_address_id | integer    | null: false, foreign_key: true |
| shipping_days_id    | integer    | null: false, foreign_key: true |
| amount              | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_one : buy

## buysテーブル

|  Culumn             | Type       |  Options   |
| ------------------- | ---------- | ----------- |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one :address


## addressesテーブル

|  Culumn             | Type       |  Options   |
| ------------------- | ---------- | ----------- |
| post_code           | string     | null: false |
| prefecture_id       | integer    | null: false, foreign_key: true |
| city                | text       | null: false |
| street              | text       | null: false |
| buildings_name      | text       |
| telephone           | string     | null: false |
| buy                 | references | null: false, foreign_key: true |

### Association
- belongs_to : buy