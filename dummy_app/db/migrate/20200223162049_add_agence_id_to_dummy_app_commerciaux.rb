class AddAgenceIdToDummyAppCommerciaux < ActiveRecord::Migration[5.2]
  def change
    add_reference :dummy_app_commerciaux, :dummy_app_agence, name: "index_dummy_app_commerciaux_on_dummy_app_agence_id", index: true, foreign_key: true
  end
end
