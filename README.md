## Furima

フリーマーケットのアプリケーションを作成しました。<br>
ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

## 使用技術

- HTML,CSS
- ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 14.14
- AWS
  - EC2
- heroku
- RSpec

## テスト

- RSpec
  - 単体テスト(model)

## アプリケーションのURL

https://furima-38304.herokuapp.com/

## テスト用アカウント

- ID／Pass
  - ID：admin
  - Pass： 2222

- テスト用アカウント等
  - 購入者用
    - メールアドレス：a@test
    - パスワード：111aaa
    - ユーザー名：hirata
    - 購入用カード情報
      - 番号：4242424242424242
      - 期限：2024年3月
      - セキュリティコード：123
  - 出品者用
    - メールアドレス名：b@test
    - パスワード：111aaa
    - ユーザー名：rikako

## データベース設計

[![Image from Gyazo](https://i.gyazo.com/ba9a79cd030579fad76fbe29443ba0e1.png)](https://gyazo.com/ba9a79cd030579fad76fbe29443ba0e1)

## 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/72ef782d815d48a98d956ecf6cd356fb.png)](https://gyazo.com/72ef782d815d48a98d956ecf6cd356fb)

## テーブル設計

### usersテーブル

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

### itemsテーブル

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
| delivery_day_id | integer | null: false | 


### Association

- belongs_to :user
- has_one_attached :image
- has_one :order

### ordersテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| item | references | null: false, foreign_key: true |                     
| user | references | null: false, foreign_key: true | 


### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery

### deliveriesテーブル

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

