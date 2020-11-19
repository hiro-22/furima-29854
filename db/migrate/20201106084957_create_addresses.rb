class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table   :addresses do |t|
      t.string     :post_code,     null: false
      t.integer    :prefecture_id, null: false 
      t.string     :city,          null: false
      t.string     :city2,         null: false
      t.string     :bill,          null: false
      t.string     :phone_num,     null: false
      t.references :order,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
