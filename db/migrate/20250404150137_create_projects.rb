class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false

      create_enum :project_status, ["not_started", "in_progress", "done"]
      t.enum :status, enum_type: "project_status", null: false, default: :not_started

      t.timestamps
    end
  end
end
