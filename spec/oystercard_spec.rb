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

  describe "#deduct" do

    # it "deducts money from balance" do
    #   subject.top_up(15)
    #   expect(subject.deduct(12)).to eq 3
    # end

  end

  describe "#touch_in" do
    it "returns message when touch in" do
      subject.top_up(10)
      expect(subject.touch_in).to eq "in use"
    end

    it "raises an error if the balance is less than one" do
      expect { subject.touch_in }.to raise_error("Insufficient funds")
    end
  end

  describe "#touch_out" do
    it "returns message when touch out" do
      expect(subject.touch_out).to eq "not in use"
    end

    it "reduces balance by 1" do
      subject.top_up(10)
      expect { subject.touch_out }.to change{ subject.balance }.by(-1)
    end
  end

  describe "#in_journey?" do
    it "checks if we are in journey or not" do
      expect(subject.in_journey?).to eq "not in use"
    end
  end

end
