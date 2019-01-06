require 'csv'
namespace :csv do
  desc "Importa o arquivo teste.csv"
  task import: :environment do
  	CSV.foreach('tmp/teste.csv', col_sep: ';').with_index do |linha,indice|
  		unless (indice == 0) 
  			Pontuation.create!(data: linha[0], nome: linha[1], idUsuario: linha[2], pontos: linha[3])
  		end
  	end
  end

end


