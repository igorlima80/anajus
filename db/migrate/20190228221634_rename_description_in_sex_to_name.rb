class RenameDescriptionInSexToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :sexes, :description, :name
  end
end
