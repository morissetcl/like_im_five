class CreateDummyAppArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_app_articles do |t|
      t.string :title
      t.string :body
      t.references :dummy_app_user, foreign_key: true

      t.timestamps
    end
  end
end
