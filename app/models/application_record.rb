class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  	#attr_accessor :data, :nome, :idUsuario, :pontos


 	def self.conexao_banco()	
 		#array para salvar as pontuações
 		pontuacoes = []

 		#conexao com o banco
	  	conn = ActiveRecord::Base.connection
	  	#apagar = conn.execute "DELETE FROM Pontuations"

	  	#busca no banco
		result_group = conn.execute "SELECT data, nome, idUsuario, SUM(pontos) FROM Pontuations GROUP BY idUsuario"
		result_group.each do |user|
								
			puts "DATA: #{user[0]}"  
			puts "NOME: #{user[1]}"
			puts "IDUSUARIO: #{user[2]}"
			puts "PONTOS: #{user[3]}"
			
			if user[3] >= 3126
				puts "**** Ótimo desempenho #{user[1]}!! ****"
			end

			puts 

			#cria novo objeto
			pontuacao_atualizada = Pontuation.new(:data => user[0], :nome => user[1], :idUsuario => user[2], :pontos => user[3])


			#adiciona o objeto no array
			pontuacoes << pontuacao_atualizada	

		end

	end
  
end
