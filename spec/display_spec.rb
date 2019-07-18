require 'display'

describe Display do
  let(:list_pages_visits) do
    [
      { name: '/help_page/1', visits: 3 },
      { name: '/about/2', visits: 2 },
      { name: '/home', visits: 1 }
    ]
  end

  let(:list_pages_unique_views) do
    [
      { name: '/about/2', unique_views: 2 },
      { name: '/home', unique_views: 1 },
      { name: '/help_page/1', unique_views: 1 }
    ]
  end

  subject(:display) { described_class.new }

  describe 'displays the descendant ordered list' do
    it 'show the formated list' do
      expect { display.show(list_pages_visits, 'visits') }.to output(
        '/help_page/1 3 visits /about/2 2 visits /home 1 visits '
      )
        .to_stdout
    end
    it 'show the formated list' do
      expect {
        display.show(list_pages_unique_views, 'unique_views')
      }.to output(
        '/about/2 2 unique views /home 1 unique views /help_page/1 1 unique views '
      )
        .to_stdout
    end
  end
end
