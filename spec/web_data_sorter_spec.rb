require 'web_data_sorter'

describe WebDataSorter do
  let(:file) { './spec/webserver_test.log' }
  subject(:web_data_sorter) { described_class.new(file) }

  describe 'it sorts pages with the most views' do
    it 'return a descendant ordered list' do
      expect(web_data_sorter.sort_by_most_views).to eq(
        [
          { name: '/help_page/1', visits: 3 },
          { name: '/about/2', visits: 2 },
          { name: '/home', visits: 1 }
        ]
      )
    end
  end
end
