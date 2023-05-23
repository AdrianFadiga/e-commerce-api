class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
