require 'spec_helper'

RSpec.describe 'script2md' do
  subject { `sc2md #{file_path}`.gsub(/[\r\n]+\z/, '') } 

  let(:file_path) { './spec/fixtures/output.sh' }
  let(:converted_markdown) { File.read('./spec/fixtures/output.sh.md') }
  
  it { is_expected.to eq converted_markdown.gsub(/[\r\n]+\z/, '') }
end

