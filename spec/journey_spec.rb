require 'journey'

describe Journey do

  let(:station) { double("station") }

  describe '#fare' do
    it 'returns minimum fare if touched in and out' do
      allow(subject).to receive(:complete?) { true }
      allow(subject).to receive(:started?) { true }
      expect(subject.fare).to eq Journey::MIN_FARE
    end

    it 'returns penalty fare when journey is incomplete' do
      allow(subject).to receive(:complete?) { false }
      allow(subject).to receive(:started?) { true }
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns 0 if journey hasn\'t started' do
      allow(subject).to receive(:complete?) { false }
      allow(subject).to receive(:complete?) { false }
      expect(subject.fare).to eq 0
    end
  end

end
