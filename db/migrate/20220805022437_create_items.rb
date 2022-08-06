class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :item_name,         null: false
      t.text        :content,           null: false
      t.integer     :price,             null: false
      t.references   :user,              null: false, foreign_key: true
      t.integer     :category_id,       null: false
      t.integer     :condition_id,      null: false
      t.integer     :shippingfee_id,    null: false
      t.integer     :prefecture_id,     null: false
      t.integer     :delivery_day_id,  null: false
      t.timestamps
    end
  end
end
