require_relative '../lib/game'


describe 'A game of rock paper scissors' do
  let(:game) { Game.new }
  let(:started_game) {
    game = Game.new
    game.start
    game
  }

  it 'exists' do
    :game
  end

  it 'can start' do
    game.start
  end

  it 'is not initially started' do
    expect(game).to_not be_started
  end

  it 'a started game knows that it has started' do
    expect(started_game).to be_started
  end

  describe 'playing' do

    context 'without starting' do
      it 'can not be played if it has not started' do
        expect { game.play }.to raise_error(RuntimeError)
      end
    end

    context 'after starting' do
      it 'can be played if it has started' do
        expect { started_game.play }.to_not raise_error
      end

      it 'returns nil when not provided with anything' do
        expect(started_game.play).to be_nil
      end

      it 'returns nil when only provided one rock, paper or scissor' do
        expect(started_game.play(:FAKE)).to be_nil
      end

      it 'does not return nil when two objects are provided' do
        expect(started_game.play(:FAKE, :FAKE)).to_not be_nil
      end
    end

    context 'rock vs scissors' do
      it 'announces the correct winner' do
        expect(started_game.play(:rock, :scissors)).to eq("Rock beats scissors!")

        game.start
        expect(game.play(:scissors, :rock)).to eq("Rock beats scissors!")
      end

      it 'will mark the game as finished' do
        started_game.play(:rock, :scissors)

        expect(started_game).to be_finished
      end
    end

    context 'rock vs paper' do
      it 'announces the correct winner' do
        expect(started_game.play(:paper, :rock)).to eq("Paper beats rock!")
        
        game.start
        expect(game.play(:rock, :paper)).to eq("Paper beats rock!")
      end

      it 'will mark the game as finished' do
        started_game.play(:rock, :paper)

        expect(started_game).to be_finished
      end
    end

    context 'scissors vs paper' do
      it 'announces the correct winner' do
        expect(started_game.play(:scissors, :paper)).to eq("Scissors vs paper!")

        game.start
        expect(game.play(:paper, :scissors)).to eq("Scissors vs paper!")
      end

      it 'will mark the game as finished' do
        started_game.play(:scissors, :paper)

        expect(started_game).to be_finished
      end
    end

    context 'a tie game' do
      it 'announces the correct winner' do
        expect(started_game.play(:rock, :rock)).to eq("Tie game. Try again!")
        expect(started_game.play(:paper, :paper)).to eq("Tie game. Try again!")
        expect(started_game.play(:scissors, :scissors)).to eq("Tie game. Try again!")
      end

      it 'will mark the game as finished' do
        started_game.play(:scissors, :scissors)

        expect(started_game).to_not be_finished
      end
    end

  end

end
