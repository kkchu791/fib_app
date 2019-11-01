class CreateFibNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :fib_numbers do |t|
      t.integer :current
      t.integer :previous
      t.integer :next

      t.timestamps
    end
  end
end
