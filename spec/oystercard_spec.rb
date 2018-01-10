require 'oystercard'

describe Oystercard do

  describe "#balance" do

    it 'initializes with a balance of 0' do
      expect(subject.balance).to eq 0
    end

  end

  describe "#top_up" do

    it "tops up the balance" do
      expect { subject.top_up(10) }.to change { subject.balance }.to(10)
    end

    it "raises error if putting maximum limit on card" do
      expect { subject.top_up((Oystercard::CARD_LIMIT) + 1) }.to raise_error("There cannot be more than #{Oystercard::CARD_LIMIT} on the card")
    end

  end

  describe "#touch_in" do

    let(:station) { double("station") }

    it "raises an error if the balance is less than one" do
      expect { subject.touch_in(station) }.to raise_error("Insufficient funds")
    end

  end

  describe "#touch_out" do

    let(:station) { double("station") }
    let(:exit_station) { double("station") }

    it "reduces balance by 1" do
      subject.top_up(10)
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change{ subject.balance }.by(-1)
    end

    it "stores journey" do
      subject.top_up(10)
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change{ subject.history }.to([{entry_station: station, exit_station: station}])
    end

  end

  describe "#history" do
    it "initializes with no journey history" do
      expect(subject.history).to eq []
    end
  end

end
