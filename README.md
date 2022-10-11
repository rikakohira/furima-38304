# FURIMA
**目的：プログラミングスクールの卒業課題として作成**<br>

商品を出品し、売買ができるフリーマーケットアプリです。<br>
ユーザー登録すると商品を出品でき、自身が出品した商品は編集と削除をすることができます。<br>
他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

# URL

https://furima-38304.herokuapp.com/

- ID／Pass
  - ID：admin
  - Pass： 2222

- テスト用アカウント
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

# 使用技術

- HTML,CSS
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 14.14
- JavaScript
- AWS
  - EC2
- heroku
- RSpec

# 機能一覧
- ユーザー管理機能(devise)
  - 新規登録機能
  - ログイン機能

- 商品出品機能(JavaScript)
  - 編集機能
  - 削除機能
  
- 商品購入機能(Formオブジェクト, PAY.JP)

- 商品一覧表示機能
  - 商品詳細表示機能

# 最終課題を経ての気づき
**■ 工夫した点**<br>

工夫した点は、3つあります。<br>
1つ目は、プログラミングノートの作成です。カリキュラムで学んだことの要点や、ネットで見つけた理解しやすい表現を自分の言葉でまとめたり、エラーとその解決方法を書き留めたりしました。エラーに関しては、考えられる原因と仮説をセットで記述し、様々なエラー対応を想定しています。　<br>
2つ目は、ショートカットキーを活用し、作業時間を短縮したことです。ショートカットキーの活用は、仕事の現場において必ず必要となる技術です。プログラミング学習期間中から、意識して使用するようにしていました。<br>
3つ目は、コードレビューの訂正依頼に対し、的確に修正を行うことです。まず、なぜ修正が必要なのか、問題の本質を理解するようにしました。問題の本質に対して的確に修正を行うことにより、短いやり取りでLGTMに辿り着くことができます。<br>


**■ 苦労した点**<br>

苦労した点は2つあります。<br>
1つ目は、テストコードのダミーデータ作りです。Faker(Gem)の理解が不足していたことに原因があります。以後、公式のサイトで仕様の確認を必ず行うようにしています。<br>
2つ目は、Formオブジェクトを用いた商品購入機能の実装です。ビューファイルに表示したい値をテーブルから引っ張って来ることに苦労しました。模索する中で、SQLによるテーブル操作がなぜモデルで実現するのか疑問に思いました。探求した結果、ActiveRecordについて理解が深まり、オブジェクト指向に対しての苦手意識を払拭することができました。<br>
最終課題の実装を通して、当たり前のことですが「基本に目を向ける」大切さを身に染みて感じました。熟考することが大切な場面もありますが、悩んだら一度立ち止まり、基本に戻って考え直すと、意外にもエラー解消の糸口が見つかったということが多々ありました。また、見直す際、自分の書いたコードを理解することに時間がかかってしまうということがありました。可読性の高いコードの記述力を養うことが、今後の課題です。
 
# テスト

- RSpec
  - 単体テスト(model)
  
# データベース設計

[![Image from Gyazo](https://i.gyazo.com/ba9a79cd030579fad76fbe29443ba0e1.png)](https://gyazo.com/ba9a79cd030579fad76fbe29443ba0e1)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/72ef782d815d48a98d956ecf6cd356fb.png)](https://gyazo.com/72ef782d815d48a98d956ecf6cd356fb)

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
| delivery_day_id | integer | null: false | 


### Association

- belongs_to :user
- has_one_attached :image
- has_one :order

## ordersテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| item | references | null: false, foreign_key: true |                     
| user | references | null: false, foreign_key: true | 


### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery

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

