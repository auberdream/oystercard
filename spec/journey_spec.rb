require 'journey'

describe Journey do

  let(:station) { double("station") }

  describe '#fare' do
    it 'returns minimum fare if touched in and out' do
      allow(subject).to receive(:complete?) { true }
      expect(subject.fare).to eq Journey::MIN_FARE
    end

    it 'returns penalty fare when journey is incomplete' do
      allow(subject).to receive(:complete?) { false }
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end


end
