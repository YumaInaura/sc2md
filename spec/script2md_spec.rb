RSpec.describe Script2md do
  describe '.convert' do
    subject { described_class.convert(text)  } 

    let(:text) { File.read('spec/fixtures/example.sh') }

    let(:converted_markdown) { File.read('spec/fixtures/example.md') }

    it { is_expected.to eq converted_markdown.chomp }
  end
end
