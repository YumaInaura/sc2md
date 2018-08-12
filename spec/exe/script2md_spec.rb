RSpec.describe 'script2md' do
    subject { `script2md #{file_path}`.chomp } 

    context 'when sh file' do
      let(:file_path) { './spec/fixtures/example.sh' }
      let(:converted_markdown) { File.read('spec/fixtures/example.sh.md') }

      it { is_expected.to eq converted_markdown.chomp }
    end

    context 'when rb file' do
      let(:file_path) { './spec/fixtures/example.rb' }
      let(:converted_markdown) { File.read('spec/fixtures/example.rb.md') }

      it { is_expected.to eq converted_markdown.chomp }
  end
end

