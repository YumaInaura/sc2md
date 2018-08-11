RSpec.describe Script2md do
  describe '.convert' do
    subject { described_class.convert(text)  } 
    let(:text) do
      <<~SCRIPT
        #!/bin/bash -eu
        
        # # Header1
        #
        # This is a shell script comment
        # will be converted to markdown plain text

        echo $((RANDOM))
        echo ok # This line is 

        $echo_command='echo convert to markdown'
        eval $echo_command

        # - list 1
        # - list 2
        # - list 3

        echo can you find well converting
        echo and formatting with this gem?
      SCRIPT
    end

    it { is_expected.to include '# Header1' }
    it { is_expected.not_to include '/bin/bash' }
    it { is_expected.not_to include '\`\`\`bash' }
  end
end
