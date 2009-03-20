class CreateUserBalanceActions < ActiveRecord::Migration
  def self.up
    create_table :user_balance_actions, :id => false do |t|
      t.references :user
      t.string :direction
      t.decimal :value, :precision => 10, :scale => 2
      t.string :comment
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :user_balance_actions
  end
end
