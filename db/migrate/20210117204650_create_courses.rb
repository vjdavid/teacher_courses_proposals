class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false, unique: true, index: true
      t.string :description

      t.timestamps
    end
  end
end
