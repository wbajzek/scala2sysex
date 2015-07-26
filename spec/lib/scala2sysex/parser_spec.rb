require 'spec_helper'

describe Scala2sysex::Parser do
  subject { described_class.new(input) }

  context 'with valid scala input' do
    let(:input) { File.read('spec/fixtures/valid_scala.scl') }
    let(:number_of_degrees) { 12 }
    let(:name) { 'Valid scala' }
    let(:expected_1byte_octave_sysex_size) { 21 }

    it 'finds the name of the scale' do
      expect(subject.name).to eq(name)
    end

    it 'returns the number of scale degrees' do
      expect(subject.number_of_degrees).to eq(number_of_degrees)
    end

    it 'returns the scale degrees' do
      expect(subject.degrees.count).to eq(number_of_degrees)
    end

    # not a very good test
    it 'converts the scale degrees to 1-byte offsets' do
      expect(subject.offsets_1byte).to be_an(Array)
    end

    it 'generates 1-byte octave sysex' do
      expect(subject.to_1byte_octave_sysex.size).to eq(expected_1byte_octave_sysex_size)
    end
  end

  context 'with invalid scala input' do
    let(:input) { File.read('spec/fixtures/too_many_lines.scl') }

    it 'raises an error' do
      expect { subject }.to raise_error
    end
  end
end
