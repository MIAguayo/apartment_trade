class CreateTradeRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :trade_requests do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :apartment_id
      t.text :body

      t.timestamps
    end
  end
end
