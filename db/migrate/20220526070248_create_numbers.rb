class CreateNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :numbers do |t|
      t.string :korean_word
      t.string :romanja
      t.string :translation
      t.string :type

      t.timestamps
    end
  end
end
