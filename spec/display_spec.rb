require 'display'

describe Display do
  let(:list_pages) do
    [
      { name: '/help_page/1', visits: 3 },
      { name: '/about/2', visits: 2 },
      { name: '/home', visits: 1 }
    ]
  end

  subject(:display) { described_class.new }

  describe 'displays the descendant ordered list' do
    it 'show the formated list' do
      expect { display.show(list_pages) }.to output(
        '/help_page/1 3 visits /about/2 2 visits /home 1 visits '
      )
        .to_stdout
    end
  end
end
