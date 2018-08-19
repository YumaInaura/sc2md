require 'spec_helper'

RSpec.describe 'script2md' do
    subject { `sc2md #{file_path}`.chomp } 

    context 'when read from local file' do
      context 'when sh file' do
        let(:file_path) { './spec/fixtures/output.sh' }
        let(:converted_markdown) { File.read('./spec/fixtures/output.sh.md').chomp }
  
        it { is_expected.to eq converted_markdown.chomp }
      end
  
      context 'when rb file' do
        let(:file_path) { './spec/fixtures/example.rb' }
        let(:converted_markdown) { File.read('spec/fixtures/example.rb.md').chomp }
  
        it { is_expected.to eq converted_markdown.chomp }
    end
  end
end

