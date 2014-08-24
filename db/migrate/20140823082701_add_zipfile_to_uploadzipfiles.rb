class AddZipfileToUploadzipfiles < ActiveRecord::Migration
  def change
    add_column :uploadzipfiles, :zipfile, :string
  end
end
