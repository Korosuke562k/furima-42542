# README

# #users テーブル

|  Column               | Type    |  Options   |
| --------------------- | ------- | ---------- |
| name                  | string  | null:false |
| furikana              | string  | null:false |
| birthday              | integer | null:false |
| nickname              | string  | null:false |
| email                 | string  | null:false, unique: true  |
| encrypted_password    | string  | null:false |
| password_confirmation | string  | null:false |


## items テーブル

|  Column             | Type       |  Options   |
| ------------------- | ---------- | ---------- |
| name                | string     | null:false |
|text                 | text       | null:false |
| category_id         | references | null: false, foreign_key: true |
| status_id           | references | null: false, foreign_key: true |
| delivery_fee_id     | references | null: false, foreign_key: true |
| shipping_address_id | references | null: false, foreign_key: true |
| shipping_days_id    | references | null: false, foreign_key: true |
| amount              | integer    | null:false |
| user_id             | references | null: false, foreign_key: true |

## Buysテーブル

|  Column             | Type       |  Options   |
| ------------------- | ---------- | ---------- |
| credit_info         | integer    | null:false |
| post-code           | integer    | null: false |
| prefecture_id       | references | null: false, foreign_key: true |
| city                | text       | null:false |
| street              | text       | null:false |
| buildings_name      | text       | null:false |
| telephone           | integer    | null:false |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |