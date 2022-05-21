class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :family_member, null: false, foreign_key: true
      t.string :description, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
