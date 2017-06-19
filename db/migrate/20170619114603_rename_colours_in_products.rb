class RenameColoursInProducts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :colour, :more_about
  end
end
