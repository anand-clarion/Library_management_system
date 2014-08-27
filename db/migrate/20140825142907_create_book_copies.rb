class CreateBookCopies < ActiveRecord::Migration
  def up
    create_table :book_copies do |t|
      t.belongs_to :book
      t.boolean :is_active, :default => true
      t.boolean :is_assigned, :default => false    
      t.timestamps
    end
  end

  def down
    drop_table :book_copies
  end
end
