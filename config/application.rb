require_relative 'boot'
require 'listen'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gamificacao
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #função para monitorar o diretório. A função tem a restrição de monitorar apenas
    #arquivos csv que são de fato, os arquivos que contem as infos necessárias
  	listener = Listen.to('tmp/', only:/\.csv$/) do |m, a, r|
  		puts "modficado: #{m}"
  		puts "add: #{a}"
  		Pontuation.read_file(a) #função para ler o arquivo adicionado
  		puts "remove: #{r}"
  	end
  	listener.start
  	
  end
end
