require 'oystercard'

describe Oystercard do

  let(:station) { double("station") }

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

    it "raises an error if the balance is less than one" do
      expect { subject.touch_in(station) }.to raise_error("Insufficient funds")
    end

    it 'charges penalty if touched in twice' do
      subject.top_up(10)
      subject.touch_in(station)
      expect { subject.touch_in(station) }.to change{ subject.balance }.by(-6)
    end

  end

  describe "#touch_out" do

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

    it 'charges penalty if touched out without touching in' do
      subject.top_up(10)
      expect { subject.touch_out(station) }.to change{ subject.balance }.by(-6)
    end

  end

  describe "#history" do
    it "initializes with no journey history" do
      expect(subject.history).to eq []
    end

    it 'adds an incomplete journey to history' do
      subject.top_up(10)
      subject.touch_in(station)
      expect {subject.touch_in(station)}.to change{ subject.history }.to ([{entry_station: station, exit_station: nil}])
    end

  end

end
