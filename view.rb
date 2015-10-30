class View

	def initialize
	end

	def user_input
		print "=>"
		gets.chomp
	end

	def welcome_message
		puts "Hola, ¿estás listo para jugar Maratón? presiona 'enter'"
	end

	def show_quizz(quizz)
		puts quizz
	end

	def show_score(trues, falses)
		puts "respuestas malas:#{falses}, respuestas buenas: #{trues}"
	end

	def message_end
		puts "Terminaste el juego. Tus resultados son:"
	end

	def test_response(resp, qual)
		puts "Intento: #{resp}"
		if qual == false
		  puts "Incorrecto!"
	  else
		  puts "Correcto"
	  end
	end
end