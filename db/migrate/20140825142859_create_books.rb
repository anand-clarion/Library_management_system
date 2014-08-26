class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :title, :limit => 30
      t.string :author, :limit => 30
      t.integer :no_of_copy, :limit => 2
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
