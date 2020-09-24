class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :post_code
      t.string :addressee
      t.string :address

      t.timestamps
    end
  end
end
