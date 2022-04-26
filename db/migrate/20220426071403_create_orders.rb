class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :slug
      t.belongs_to :resume, null: false, foreign_key: true
      t.integer :price
      t.string :status, default: "pending"
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
