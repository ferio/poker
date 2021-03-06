class Actions::BetAction < Action
  KIND = 3

	def after_initialize
		self.value += player.for_call
	end

	def has_value?
		true
	end

  def can_perform?
    return (player.stack >= player.for_call + value and
      value >= game.minimal_bet and game.current_bet == game.blind_size)
  end

  def game_influence
    game_params[:current_bet] = game.current_bet + value
    super
  end

  include StackAffectedAction
end
