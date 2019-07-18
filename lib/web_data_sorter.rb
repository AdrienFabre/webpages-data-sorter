class WebDataSorter
  attr_accessor :views

  def initialize(file_path)
    file_path_valid?(file_path)

    @views = Hash.new { |page, ips| page[ips] = [] }
    format_views_hash(file_path)
  end

  def sort_by_most_visits
    type = 'visits'
    pages_data = collect_data(type)
    sort_by_reverse_order(pages_data, type)
  end

  def sort_by_most_unique_views
    type = 'unique_views'
    pages_data = collect_data(type)
    sort_by_reverse_order(pages_data, type)
  end

  private

  def file_path_valid?(file_path)
    raise "No such file @ #{file_path}" unless File.file? file_path
  end

  def format_views_hash(file)
    all_lines = File.readlines file
    all_lines.each do |line|
      page, ip = *line.split(/\s+/)
      views[page] << ip
    end
  end

  def collect_data(type)
    pages_data = []
    views.map { |page, ip| pages_data << format_page(page, ip, type) }
    pages_data
  end

  def format_page(page, ip, type)
    page_data = Hash.new(0)
    page_data[:name] = page
    page_data[type.to_sym] = (type == 'visits' ? ip.count : ip.uniq.count)
    page_data
  end

  def sort_by_reverse_order(pages_data, type)
    pages_data.sort_by { |pages| pages[type.to_sym] }.reverse
  end
end
