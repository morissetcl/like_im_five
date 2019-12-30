class CreateDummyAppCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_app_categories do |t|
      t.string :label

      t.timestamps
    end
  end
end
