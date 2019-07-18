class WebDataSorter
  attr_accessor :views

  def initialize(file)
    @views = Hash.new { |page, ips| page[ips] = [] }
    format_views_hash(file)
  end

  def sort_by_most_views
    pages_data = []
    views.each { |page, ip| pages_data << format_page(page, ip) }
    pages_data.sort_by { |pages| pages[:visits] }.reverse
  end

  private

  def format_views_hash(file)
    all_lines = File.readlines file
    all_lines.each do |line|
      page, ip = *line.split(/\s+/)
      views[page] << ip
    end
  end

  def format_page(page, ip)
    page_with_visits = Hash.new(0)
    page_with_visits[:name] = page
    page_with_visits[:visits] = ip.count
    page_with_visits
  end
end
