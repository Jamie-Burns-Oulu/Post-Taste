class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :live

      t.timestamps
    end
  end
end
