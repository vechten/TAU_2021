require 'rails_helper'

RSpec.describe PrimeNumberChecker do
  subject { service }
  describe 'mock service all_prime' do
    let(:service) { instance_double(PrimeNumberChecker) }

    before do
      allow(PrimeNumberChecker).to receive(:new).with([3,4,6,7,9]).and_return(service)
      allow(service).to receive(:all_prime?).and_return(true)
      allow(service).to receive(:prime_filter).and_return([999])
      allow(service).to receive(:no_prime?).and_return('false')
    end

    it { expect(subject.all_prime?).to be_truthy }
    it { expect(subject.prime_filter).to eq([999]) }
    it { expect(subject.no_prime?).to eq('false') }
  end

  describe 'mock service StringChanger' do
    let(:service) { instance_double(StringChanger) }

    before do
      allow(StringChanger).to receive(:new).with('Hey World').and_return(service)
      allow(service).to receive(:string_boolean?).and_return(true)
      allow(service).to receive(:to_arr).and_return(['Hello World'])
      allow(service).to receive(:string_take_number).and_return('33333')
    end

    it { expect(subject.string_boolean?).to be_truthy }
    it { expect(subject.to_arr).to eq(['Hello World']) }
    it { expect(subject.string_take_number).to eq('33333') }
  end
end
