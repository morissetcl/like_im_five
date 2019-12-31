class CreateDummyAppAgence < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_app_agence do |t|
      t.string :name
      t.references :dummy_app_commercial, foreign_key: true

      t.timestamps
    end
  end
end
