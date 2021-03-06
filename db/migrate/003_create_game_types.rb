class CreateGameTypes < ActiveRecord::Migration
  def self.up
    create_table :game_types do |t|
      t.string  :title
      t.integer :max_players
      t.integer :start_stack
      t.decimal :start_cash, :precision => 10, :scale => 2
      t.decimal :additional_cash, :precision => 10, :scale => 2
      t.integer :start_blind
      t.integer :bet_multiplier
      t.integer :change_level_time
      t.integer :time_for_action
      t.string  :template
      t.integer :min_level
      t.integer :max_level

      t.timestamps
    end

    3.times do |i|
      params = {
         :title => " #{i+1} Тип",
         :max_players => 2 + i,
         :start_stack => 1000 * (i + 1),
         :start_cash => i + 5,
         :additional_cash => i,
         :start_blind => 100 * (i + 1),
         :bet_multiplier => 2,
         :change_level_time => 4 + i,
         :time_for_action => 10,
         :min_level => 0,
         :max_level => 10
      }
      GameType.create params
    end
  end

  def self.down
    drop_table :game_types
  end
end
