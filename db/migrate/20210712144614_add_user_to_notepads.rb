class AddUserToNotepads < ActiveRecord::Migration[6.1]
  def change
    add_reference :notepads, :user, null: false, foreign_key: true
  end
end
