class CreateFamilyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :family_members do |t|
      t.string :name, null: false
      t.integer :tasks_count, default: 0, null: false

      t.timestamps
    end
  end
end
