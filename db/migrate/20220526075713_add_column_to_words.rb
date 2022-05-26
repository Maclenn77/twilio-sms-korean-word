class AddColumnToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :variant, :string
  end
end
