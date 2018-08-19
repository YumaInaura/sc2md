require 'spec_helper'

RSpec.describe Script2md do
  describe '.convert' do
    subject { described_class.convert(text, language_type: language_type)  } 

    let(:text) { File.read('spec/fixtures/example.sh') }
    let(:language_type) { 'sh' }
    let(:converted_markdown) { File.read('spec/fixtures/example.sh.md') }

    it { is_expected.to eq converted_markdown.chomp }
  end
end

