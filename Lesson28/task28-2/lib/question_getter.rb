# encoding: utf-8

require 'rexml/document'

class QuestionGetter
  def self.from_xml(path)
    unless File.exists?(path)
      raise "Ни одного вопроса не найдено!"
    end

    library = []

    document = File.open(path, 'r'){|file| REXML::Document.new(file)}

    document.get_elements('quiz/questions').each do |element|
      question = element.elements['question'].text
      answer = element.elements['answer'].text
      comment = element.elements['comment'].text

      library << Question.new(question, answer, comment)
    end

    library
  end
end
