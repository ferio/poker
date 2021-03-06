# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090226132804) do

  create_table "actions", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.string   "type"
    t.integer  "value"
    t.datetime "created_at"
  end

  create_table "blind_values", :id => false, :force => true do |t|
    t.integer "level"
    t.integer "value"
    t.integer "ante"
    t.integer "game_type_id"
  end

  create_table "game_types", :force => true do |t|
    t.string   "title"
    t.integer  "max_players"
    t.integer  "start_stack"
    t.decimal  "start_cash",        :precision => 10, :scale => 2
    t.decimal  "additional_cash",   :precision => 10, :scale => 2
    t.integer  "start_blind"
    t.integer  "bet_multiplier"
    t.integer  "change_level_time"
    t.integer  "time_for_action"
    t.string   "template"
    t.integer  "min_level"
    t.integer  "max_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.string   "status"
    t.integer  "active_player_id", :default => 0
    t.integer  "blind_position"
    t.integer  "blind_size"
    t.integer  "blind_level",      :default => 0
    t.integer  "ante",             :default => 0
    t.integer  "current_bet"
    t.datetime "next_level_time"
    t.integer  "players_count",    :default => 0
    t.string   "flop"
    t.string   "turn"
    t.string   "river"
    t.text     "deck"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "about_user_id"
    t.integer "color"
    t.string  "description"
  end

  create_table "players", :force => true do |t|
    t.integer  "sit"
    t.integer  "stack"
    t.integer  "for_call",            :default => 0
    t.integer  "in_pot",              :default => 0
    t.string   "status"
    t.text     "hand"
    t.boolean  "open_hand"
    t.datetime "action_time"
    t.datetime "control_action_time"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_balance_actions", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.string   "direction"
    t.decimal  "value",      :precision => 10, :scale => 2
    t.string   "comment"
    t.datetime "created_at"
  end

  create_table "user_infos", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.date     "birthday"
    t.string   "language"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password",                                   :default => "",   :null => false
    t.string   "password_salt",                                      :default => "",   :null => false
    t.integer  "type"
    t.string   "email"
    t.string   "locate"
    t.decimal  "cash",                :precision => 10, :scale => 2, :default => 0.0
    t.integer  "chips",                                              :default => 1000
    t.integer  "level",                                              :default => 0
    t.string   "persistence_token",                                  :default => "",   :null => false
    t.string   "single_access_token",                                :default => "",   :null => false
    t.string   "perishable_token",                                   :default => "",   :null => false
    t.integer  "login_count",                                        :default => 0,    :null => false
    t.integer  "failed_login_count",                                 :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
