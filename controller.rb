=begin
Educational game wich operates under streams, using
classes and performing it in order MVC
=end

#'model' and 'view' files are required
require_relative 'model.rb'
require_relative 'view.rb'

#it controls model and view
class CardController
  #it initializes instances of 'Record' and 'View' classes
	def initialize
		@model = Record.new
		@view = View.new
		run
	end

  #This method operate interaction between 'view' and 'model'
  #through methods.
	def run
		count = 0
		@wrong = false
		@false_count = 0
		@true_count = 0
		@view.welcome_message
	  10.times do 
		  q_list = read
			quizz = @model.search_question(count, q_list)
			answer = @model.search_answer(count, q_list)
			@view.show_quizz(quizz)
			response = @view.user_input
			comparation(response, answer)
			@view.test_response(response, @wrong)
      count += 1
	  end
	  @view.message_end
	  @view.show_score(@true_count, @false_count)
	end

  #it reads csv and creates an Array of objects 'Question'
	def read
		@model.read
	end

  #it evaluates answer of question and response from user
	def comparation(resp, ans)
		if resp == ans
			@true_count += 1
			@wrong = true
		else 
			@false_count += 1
			@wrong = false
		end	
	end

end

#it creates an instance of 'CardController' class
maraton = CardController.new
