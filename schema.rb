# -*- coding: utf-8 -*-
# Cria uma nova base de dados a cada vez. 
# Para criar o bd execute "ruby criaSchema.rb".

require 'rubygems'
require 'active_record'

# Gema do banco de dados:
require 'sqlite3' # Sqlite3
#require 'mysql2'  # Mysql/maria
#require 'pg'      # Postgresql

# As linhas abaixo indicam o SGBD a ser usado e o nome
# do arquivo que contém o banco de dados
 
# SQlite3 (aquivo Aulas.sqlite3)
ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "Orquestra.sqlite3" 
#
# Mysql/maria
#ActiveRecord::Base.establish_connection :adapter => "mysql2",
#                                        :database => "[NOME DO DATABASE]",
#                                        :encoding => "utf8",
#                                        :username => "[USUARIO DO BANCO]",
#                                        :password => "[PASSWORD]",
#                                        :host => "localhost"
#
# PostgreSQL 
#ActiveRecord::Base.establish_connection :adapter => "pg",
#                                        :database => "bmuller",
#                                        :encoding => "utf8",
#                                        :username => "aulas",
#                                        :password => "aulas",
#                                        :host => "localhost"

# As linhas abaixo criam a tabela "pessoas" dentro do banco
# "Aulas.sqlite3", indicando os atributos e os seus tipos. No caso,
# todos são "string", mas tem várias outras oportunidades.

ActiveRecord::Base.connection.create_table :integrants  do |t|
  	t.string   :nome
	t.integer  :orchestra_id
	t.integer  :instrument_id
	t.integer  :conductor_id
end

ActiveRecord::Base.connection.create_table :instruments  do |t| 
  t.string   :tipo
end

ActiveRecord::Base.connection.create_table :conductors  do |t|
  t.string   :nome 
  t.integer  :idade
end

ActiveRecord::Base.connection.create_table :orchestras do |t|
  t.string   :nome 
  t.string   :cidade
  t.integer  :conductor_id
end



# Sugestão de bibliografia:
# http://www.amazon.com/Pro-Active-Record-Databases-Experts/dp/1590598474
