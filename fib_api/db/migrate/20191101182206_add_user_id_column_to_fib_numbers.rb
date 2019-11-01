class AddUserIdColumnToFibNumbers < ActiveRecord::Migration[5.2]
  def change
    add_column :fib_numbers, :user_id, :integer
  end
end
