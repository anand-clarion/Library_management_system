class AddAvatar1ToStudent < ActiveRecord::Migration
  def up
    add_attachment :students, :avatar1
  end

  def down
    remove_attachment :students, :avatar1
  end
end
