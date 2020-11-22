class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :no
      t.string :name
      t.references :sclass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
