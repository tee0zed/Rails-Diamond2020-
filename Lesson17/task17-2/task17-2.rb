# encoding: utf-8

filename = "FACE_" + Time.now.strftime("%Y-%m-%d %H:%M:%S")

file = File.new(__dir__ + '/results/' + filename, 'w')

docs = Dir[__dir__ + '/data/*'].sort

new_face = []

docs.each do |doc|
  file.puts(File.readlines(doc, chomp: true).sample)
end

file.close
