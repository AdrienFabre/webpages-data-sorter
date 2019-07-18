describe 'User stories' do
  let(:file) { './spec/webserver_test.log' }
  let(:display) { Display.new }
  let(:web_data_sorter) { WebDataSorter.new(file) }

  describe 'displays the descendant ordered list' do
    it 'of pages with the most visits' do
      list_pages = web_data_sorter.sort_by_most_visits
      expect { display.show(list_pages, 'visits') }.to output(
        '/help_page/1 3 visits /about/2 2 visits /home 1 visits '
      )
        .to_stdout
    end

    it 'of pages with the most unique views' do
      list_pages = web_data_sorter.sort_by_most_unique_views
      expect { display.show(list_pages, 'unique_views') }.to output(
        '/about/2 2 unique views /home 1 unique views /help_page/1 1 unique views '
      )
        .to_stdout
    end
  end
end
