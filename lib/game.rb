class Game

  attr_reader :started

  def start
    @started = true
  end

  def started?
    self.started || false
  end

  def finish
    @started = false
  end

  def finished?
    !self.started
  end

  def play(left = nil, right = nil)
    raise 'Game must first be started' unless started?

    return nil unless (left && right)

    game_result = ""

    finish

    if (left == right)
      game_result = "Tie game. Try again!"

      start
    elsif (left == :rock && right == :scissors)
      game_result = "Rock beats scissors!"
    elsif (left == :scissors && right == :rock)
      game_result = "Rock beats scissors!"
    elsif (left == :paper && right == :rock)
      game_result = "Paper beats rock!"
    elsif (left == :rock && right == :paper)
      game_result = "Paper beats rock!"
    elsif (left == :scissors && right == :paper)
      game_result = "Scissors vs paper!"
    elsif (left == :paper && right == :scissors)
      game_result = "Scissors vs paper!"
    else
      game_result = :UNKNOWN
    end

    game_result
  end

end