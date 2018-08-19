require 'spec_helper'

RSpec.describe Script2md do
  describe '.convert' do
    subject { described_class.convert(text, language_type: language_type)  } 

    context 'when sh file' do
      let(:text) { File.read('spec/fixtures/example.sh') }
      let(:language_type) { 'sh' }
      let(:converted_markdown) { File.read('spec/fixtures/example.sh.md') }

      it { is_expected.to eq converted_markdown.chomp }
    end

    context 'when rb file' do
      let(:text) { File.read('spec/fixtures/example.rb') }
      let(:language_type) { 'rb' }
      let(:converted_markdown) { File.read('spec/fixtures/example.rb.md') }

      it { is_expected.to eq converted_markdown.chomp }
    end
  end
end

