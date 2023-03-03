class CreateStretches < ActiveRecord::Migration[6.0]
  def change
    create_table :stretches do |t|
      t.string :stretch_name
      t.integer :body_part_id

      t.timestamps
    end
  end
end
