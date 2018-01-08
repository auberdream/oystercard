require 'oystercard'

describe Oystercard do

  describe "#balance" do

    it 'initializes with a balance of 0' do
      expect(subject.balance).to eq 0
    end

  end

  describe "#top_up" do

    it "tops up the balance" do
      expect(subject.top_up(10)).to eq 10
    end

    it "raises error if putting maximum limit on card" do
      expect { subject.top_up((Oystercard::CARD_LIMIT) + 1) }.to raise_error("There cannot be more than #{Oystercard::CARD_LIMIT} on the card")
    end

  end

end
