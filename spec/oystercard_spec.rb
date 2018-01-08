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
  end

end
