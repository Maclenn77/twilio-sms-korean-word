class AddTypeToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :type, :string
  end
end
