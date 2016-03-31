class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender_id
      t.string :display_name
      t.text :body
      t.references :conversation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
