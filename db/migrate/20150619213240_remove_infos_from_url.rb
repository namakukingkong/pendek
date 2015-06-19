class RemoveInfosFromUrl < ActiveRecord::Migration
  def change
    remove_column :urls, :infos, :string
  end
end
