class CreateBookTransactions < ActiveRecord::Migration
  def up
    create_table :book_transactions do |t|
      t.belongs_to :book
      t.belongs_to :student
      t.datetime :issue_date
      t.datetime :return_date
      t.integer :fine, :limit => 2, :default => 0
      t.timestamps
    end
  end

  def down
    drop_table :book_transactions
  end
end
