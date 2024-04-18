class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :title,                          null: false
      t.integer    :item_price,                     null: false
      t.integer    :shipping_fee_responsibility_id, null: false
      t.text       :comment,                        null: false
      t.references :user,                           null: false, foreign_key: true
      t.integer    :item_category_id,               null: false
      t.integer    :item_condition_id,              null: false
      t.integer    :shipping_origin_id,             null: false
      t.integer    :estimated_shipping_date_id,     null: false
      t.timestamps
    end
  end
end