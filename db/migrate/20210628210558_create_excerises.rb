class CreateExcerises < ActiveRecord::Migration[6.1]
  def change
    create_table :excerises do |t|
      t.string :title
      t.string :img_url
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
