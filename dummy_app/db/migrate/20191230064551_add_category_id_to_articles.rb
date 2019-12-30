class AddCategoryIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :dummy_app_articles, :dummy_app_category, index: true
  end
end
