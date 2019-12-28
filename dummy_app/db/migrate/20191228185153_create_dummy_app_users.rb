class CreateDummyAppUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_app_users do |t|
      t.string :name
      t.string :city
      t.string :age

      t.timestamps
    end
  end
end
