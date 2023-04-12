class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :tea, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :title
      t.integer :price
      t.integer :status, default: 1
      t.string :frequency

      t.timestamps
    end
  end
end
