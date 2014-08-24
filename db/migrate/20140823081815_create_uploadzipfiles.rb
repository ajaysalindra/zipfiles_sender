class CreateUploadzipfiles < ActiveRecord::Migration
  def change
    create_table :uploadzipfiles do |t|
      t.string :name

      t.timestamps
    end
  end
end
