require 'journeylog'

describe Journeylog do
  let(:journey) { double(:journey) }
  let(:entry_station) { double(:station) }

  describe '#start'do
    it 'creates a new journey' do
      allow(Journey).to receive(:new).and_return(journey)
      allow(journey).to receive(:start)
      expect{ subject.start(entry_station) }.to change { subject.journey }.to(journey)
    end

  end
end
