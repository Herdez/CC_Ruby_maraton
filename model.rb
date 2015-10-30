require 'csv'

class Question
	attr_accessor :question, :answer

	def initialize(question, answer="")
		@question = question
		@answer = answer
	end
end


class Record

	def read
		question_list = []
		CSV.foreach('cards.csv') do |row|
      question_list << Question.new(row[0], row[1])
    end
    question_list
	end

	def search_question(num, list)
		quizz = ""
  	list.each_with_index do |question, index|
  		quizz = question.question if index == num 
  	end
  	quizz
	end

	def search_answer(num, list)
		answer = ""
		list.each_with_index do |question, index|
  		answer = question.answer if index == num 
  	end
  	answer
	end

	def create(question)
		Question.new(question)
	end

end