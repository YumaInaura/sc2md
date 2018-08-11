RSpec.describe Script2md do
  describe '.convert' do
    subject { described_class.convert(text)  } 
    let(:text) do
      <<~SCRIPT
      SCRIPT
    end

    let(:text) { File.read('spec/fixtures/example.sh') }

    let(:converted_markdown) { File.read('spec/fixtures/example.md') }

    it { is_expected.to     include '# Header1' }
    it { is_expected.not_to include '/bin/bash' }
    it { is_expected.not_to include '\`\`\`bash' }

    it { is_expected.to eq converted_markdown.chomp }
  end
end
