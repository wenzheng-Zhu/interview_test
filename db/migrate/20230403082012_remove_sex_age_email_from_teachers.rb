class RemoveSexAgeEmailFromTeachers < ActiveRecord::Migration[7.0]
  def change
    remove_column :teachers, :sex
    remove_column :teachers, :email
    remove_column :teachers, :age
  end
end
