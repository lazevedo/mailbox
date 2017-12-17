class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :is_read
      t.boolean :is_archived

      t.timestamps
    end
  end
end
