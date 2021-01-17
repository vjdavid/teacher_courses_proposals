class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :description
      t.string :email, null: false, unique: true, index: true
      t.string :full_name

      t.timestamps
    end
  end
end
