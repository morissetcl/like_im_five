class CreateDummyAppTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_app_topics do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
