class RaiseAction < BetAction
  def initialize receiver, value
    super receiver, value
  end

  def kind
    return 4
  end

  def can_perform?
    return (player.stack >= player.for_call + value and
      player.in_pot + player.for_call + value > game.current_bet)
  end
end
