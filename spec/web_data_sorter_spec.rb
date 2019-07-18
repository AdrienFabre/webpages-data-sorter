require 'web_data_sorter'

describe WebDataSorter do
  let(:file_path) { './spec/webserver_test.log' }
  subject(:web_data_sorter) { described_class.new(file_path) }

  describe 'returns the descendant ordered list' do
    it 'of pages with the most visits' do
      expect(subject.sort_by_most_visits).to eq(
        [
          { name: '/help_page/1', visits: 3 },
          { name: '/about/2', visits: 2 },
          { name: '/home', visits: 1 }
        ]
      )
    end
    it 'of pages with the most unique views' do
      expect(subject.sort_by_most_unique_views).to eq(
        [
          { name: '/about/2', unique_views: 2 },
          { name: '/home', unique_views: 1 },
          { name: '/help_page/1', unique_views: 1 }
        ]
      )
    end
  end
  describe 'returns an error message' do
    it 'raises an error if file is not found' do
      absent_file_path = './spec/webserver_absent.log'
      expect { described_class.new(absent_file_path) }.to raise_error(
        RuntimeError,
        "No such file @ #{absent_file_path}"
      )
    end
  end
end
