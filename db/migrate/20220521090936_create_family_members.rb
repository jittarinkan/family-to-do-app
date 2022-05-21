class CreateFamilyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :family_members do |t|
      t.string :name
      t.integer :tasks_count

      t.timestamps
    end
  end
end
