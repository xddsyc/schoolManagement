class CreateSclasses < ActiveRecord::Migration[6.0]
  def change
    create_table :sclasses do |t|
      t.string :grade_name
      t.text :class_name

      t.timestamps
    end
  end
end
