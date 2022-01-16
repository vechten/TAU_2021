require 'rails_helper'

RSpec.describe PrimeNumberChecker do
  let(:numbers) { (3..11) }
  subject { PrimeNumberChecker.new(numbers) }
  describe '#last_prime?' do
    it 'should return true for prime number' do
      expect(subject.last_prime?).to be_truthy
    end

    it 'should return false for no prime number' do
      numbers = (1..10)
      pnc = PrimeNumberChecker.new(numbers)
      expect(pnc.last_prime?).to be_falsey
    end
  end

  describe '#first_prime?' do
    context 'when first is prime' do
      it { expect(subject.first_prime?).to be_truthy }
    end

    context 'when first is not prime' do
      let(:numbers) { (4..11) }
      it { expect(subject.first_prime?).to be_falsey }
    end

    context 'when array is empty' do
      let(:numbers) { [] }
      it { expect(subject.first_prime?).to be_nil }
    end
  end

  describe '#prime_filter' do
    context 'when array has prime numbers' do
      let(:numbers) { (1..11) }
      it { expect(subject.prime_filter).to_not be_empty }
      it { expect(subject.prime_filter).to eq([2, 3, 5, 7, 11]) }
    end

    context 'when array dose not has prime numbers' do
      let(:numbers) { [4, 6, 8, 9] }
      it { expect(subject.prime_filter).to be_empty }
      it { expect(subject.prime_filter).to_not be_nil }
    end
  end

  describe 'no_prime?' do
    context 'when array dose not prime numbers' do
      let(:numbers) { [4, 6, 8, 9] }
      it { expect(subject.no_prime?).to be_truthy }
    end

    context 'when array has prime numbers' do
      it { expect(subject.no_prime?).to be_falsey }
    end
  end

  describe 'new tests for lab 4' do
    let(:numbers) { [4, 6, 8, 9, 7] }
    it { expect(subject.no_prime?).to be_falsey }
    it { expect(subject.prime_filter).to eq(7) }
    it { expect(subject.prime_filter.size).to eq(1) }

    context "test for new functions" do
      let(:numbers) { %w[3 4 5 6] }
      it { expect(subject.difficult_string.no_prime?).to be_falsey }
      it { expect(subject.difficult_string.prime_filter).to includes([3, 5]) }
      it { expect(subject.difficult_string.prime_filter).not_to be_empty }

    end
  end

  describe 'dependency check' do
    context 'check if there is a dependency error' do
      it { expect(subject.no_prime?).not_to raise_error }
      it { expect(subject.prime_filter).not_to raise_error }
      it { expect(Mathematical).not_to raise_error }
      it { expect(Prime).not_to raise_error }
    end
  end
end
