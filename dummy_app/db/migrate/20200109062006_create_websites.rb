class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_app_websites do |t|
      t.string :url
      t.timestamps
    end
  end
end
