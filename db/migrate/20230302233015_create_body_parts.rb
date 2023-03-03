class CreateBodyParts < ActiveRecord::Migration[6.0]
  def change
    create_table :body_parts do |t|
      t.string :body_part_name

      t.timestamps
    end
  end
end
