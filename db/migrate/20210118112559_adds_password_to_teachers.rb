class AddsPasswordToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :password_digest, :string
    add_column :teachers, :token, :string
  end
end
