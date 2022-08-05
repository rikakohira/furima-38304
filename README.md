
# テーブル設計

## usersテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| nickname | string | null: false |                  
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana | string | null: false |
| birthday | date | null: false |


### Association

- has_many :items
- has_many :orders

# テーブル設計

## itemsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| item_name | string | null: false |                     
| content | text | null: false | 
| price | integer | null: false | 
| user | references | null: false, foreign_key: true | 
| category_id | integer | null: false | 
| condition_id | integer | null: false | 
| shippingfee_id | integer | null: false | 
| prefecture_id | integer | null: false | 
| delivery_days_id | integer | null: false | 


### Association

- belongs_to :user
- has_one_attached :image
- has_one :order

# テーブル設計

## ordersテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| item | references | null: false, foreign_key: true |                     
| user | references | null: false, foreign_key: true | 


### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery

# テーブル設計

## deliveriesテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| post_code | string | null: false |                     
| prefecture_id | integer | null: false |
| city | string | null: false | 
| address | string | null: false | 
| building | string |  | 
| phone_number | string | null: false | 
| order | reference | null: false, foreign_key: true | 


### Association

- belongs_to :order
