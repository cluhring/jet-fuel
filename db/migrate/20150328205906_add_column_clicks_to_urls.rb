class AddColumnClicksToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :clicks, :integer
  end
end
