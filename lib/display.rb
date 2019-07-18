class Display
  def show(list_pages)
    list_pages.each { |page| print "#{page[:name]} #{page[:visits]} visits " }
  end
end
