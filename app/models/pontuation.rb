require 'csv'
class Pontuation < ApplicationRecord


	attr_reader :data, :nome, :idUsuario, :pontos
  	
  	@pontuacoes = []


	def self.read_file(adicionado)
	  	
  		
	  	#caso seja adicionado, o arquivo deve ser lido e inserido no banco
	  	unless (adicionado.empty?)
		  	CSV.foreach(adicionado[0], col_sep: ';').with_index do |row,indice|	
		  		#ignora o cabeçalho  		
		  		unless (indice == 0)
		  			Pontuation.create!(data: row[0], nome: row[1], idUsuario: row[2], pontos: row[3])
		  			puts"******************************"
		  		end
		  		
		  	end
		  	#função para conectar ao banco e agrupar e somar os pontos
		  	@pontuacoes = ApplicationRecord.conexao_banco()
		  	#ApplicationRecord.conexao_banco()
	  	end	  	
  	end
end
