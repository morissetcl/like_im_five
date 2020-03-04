class RemoveCommercialIdToAgency < ActiveRecord::Migration[5.2]
  def change
    remove_reference :dummy_app_agence, :dummy_app_commercial, index: true, foreign_key: true
  end
end
