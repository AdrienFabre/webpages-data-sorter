describe 'User stories' do
  let(:file) { './spec/webserver_test.log' }
  let(:display) { Display.new }
  let(:web_data_sorter) { WebDataSorter.new(file) }

  describe 'displays the descendant ordered list' do
    it 'of pages with the most views' do
      list_pages = web_data_sorter.sort_by_most_views
      expect { display.show(list_pages) }.to output(
        '/help_page/1 3 visits /about/2 2 visits /home 1 visits '
      )
        .to_stdout
    end
  end
end
