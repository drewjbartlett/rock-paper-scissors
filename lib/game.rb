require_relative 'game_result'
class Game

  attr_reader :started, :result

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

    finish

    if is_tie(left, right)
      @result = "Tie game. Try again!"
      start
    elsif is_rock_vs_scissors(left, right)
      @result = "Rock beats scissors!"
    elsif is_paper_vs_rock(left, right)
      @result = "Paper beats rock!"
    elsif is_scissors_vs_paper(left, right)
      @result = "Scissors vs paper!"
    else
      @result = :UNKNOWN
    end

    @result
  end

  def is_tie(left, right)
    left == right
  end

  def is_rock_vs_scissors(left, right)
    (left == :rock && right == :scissors) || (left == :scissors && right == :rock)
  end

  def is_paper_vs_rock(left, right)
    (left == :paper && right == :rock) || (left == :rock && right == :paper)
  end

  def is_scissors_vs_paper(left, right)
    (left == :scissors && right == :paper) || (left == :paper && right == :scissors)
  end

end