class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.string :title
      t.string :photo_data

      t.timestamps
    end
  end
end
