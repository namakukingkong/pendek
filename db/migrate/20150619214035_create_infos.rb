class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.text :raw
      t.integer :url_id

      t.timestamps null: false
    end
  end
end
