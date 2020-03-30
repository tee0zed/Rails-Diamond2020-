# encoding: utf-8

require_relative 'lib/question'
require_relative 'lib/question_getter'
require_relative 'lib/quiz'

path = __dir__ + '/data/questions.xml'

questions = QuestionGetter.from_xml(path)

quiz = Quiz.new(questions)

quiz.do_quiz

