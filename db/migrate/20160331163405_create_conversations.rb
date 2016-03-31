class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :lender_id
      t.string :borrower_id

      t.timestamps null: false
    end
  end
end
