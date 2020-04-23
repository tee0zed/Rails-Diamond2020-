require 'rexml/document'

path = __dir__ + '/card.xml'

file = File.open(path, 'r')

doc = REXML::Document.new(file)
file.close

doc.root.elements.each do |el|
  puts el.text.strip
end

