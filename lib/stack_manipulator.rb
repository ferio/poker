class StackManipulator
  def self.take_chips value, player
    player.reload
		stake_size = value
    if stake_size >= player.stack
      player.i_am_allin!
      stake_size = player.stack
    end
		raise = stake_size - player.for_call
    Player.update_all "for_call = for_call + #{raise}", ["game_id = ? AND id != ?", player.game_id, player.id] if raise > 0
    player.stack = player.stack - stake_size
    player.in_pot = player.in_pot + stake_size
    player.for_call = 0
    player.save
  end
end