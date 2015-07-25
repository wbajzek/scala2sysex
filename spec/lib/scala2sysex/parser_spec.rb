require 'spec_helper'

describe Scala2sysex::Parser do
  subject { described_class.new(input) }

  context 'with valid scala input' do
    let(:input) { File.read('spec/fixtures/valid_scala.scl') }
    let(:number_of_degrees) { 12 }
    let(:name) { 'Valid scala' }

    it 'finds the name of the scale' do
      expect(subject.name).to eq(name)
    end

    it 'returns the number of scale degrees' do
      expect(subject.number_of_degrees).to eq(number_of_degrees)
    end

    it 'returns the scale degrees' do
      expect(subject.degrees.count).to eq(number_of_degrees)
    end
  end

  context 'with invalid scala input' do
    let(:input) { File.read('spec/fixtures/too_many_lines.scl') }

    it 'raises an error' do
      expect { subject }.to raise_error
    end
  end
end
