class CreateDummyAppCommerciaux < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_app_commerciaux do |t|
      t.string :name

      t.timestamps
    end
  end
end
