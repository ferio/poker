class Player < ActiveRecord::Base

  validates_presence_of :user_id, :game_id, :sit, :stack

  belongs_to :user
  belongs_to :game, :counter_cache => :players_count

end