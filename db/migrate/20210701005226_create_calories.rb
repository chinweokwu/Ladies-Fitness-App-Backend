class CreateCalories < ActiveRecord::Migration[6.1]
  def change
    create_table :calories do |t|
      t.date :date
      t.string :calories_lost

      t.timestamps
    end
  end
end
