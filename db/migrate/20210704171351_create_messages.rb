class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true, index: false
      t.references :sender, null: false, foreign_key: { to_table: :users }, index: false
      t.index %i[user_id sender_id], unique: false

      t.timestamps
    end
  end
end
