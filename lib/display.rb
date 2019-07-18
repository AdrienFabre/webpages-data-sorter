class Display
  def show(list_pages, type)
    list_pages.each do |page|
      print "#{page[:name]} #{page[type.to_sym]} #{type.tr('_', ' ')} "
    end
  end
end
