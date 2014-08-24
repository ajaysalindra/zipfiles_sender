class CreateCyborgs < ActiveRecord::Migration
  def change
    create_table :cyborgs do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
