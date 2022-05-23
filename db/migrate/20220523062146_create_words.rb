class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :korean_word
      t.string :romanja
      t.string :translation

      t.timestamps
    end
  end
end
