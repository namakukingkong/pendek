class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :origin
      t.string :short
      t.text :infos

      t.timestamps null: false
    end
  end
end
